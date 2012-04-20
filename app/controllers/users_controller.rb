class UsersController < ApplicationController

	before_filter :check_for_profile, :except => [:new,:update]

	def index
		if current_user.designer_profile.present?
			redirect_to coders_path, :notice => "You're a designer so we're showing you coders"
		else
			redirect_to designers_path, :notice => "You're a coder so we're showing you designers who want to collaborate with coders!"
		end
	end

	def coders
		@profiles=CoderProfile.all
		@type=:coder
		
		render :index, :notice=>notice
	end

	def designers
		@profiles=DesignerProfile.all
		@type=:designer
		@max_followers=get_max_followers
		
		render :index, :notice => notice
	end
  
	def new
		if current_user.designer_profile.present? || current_user.coder_profile.present?
			redirect_to users_path, :notice=>"You've already created an account!"
			return
		end

		@user=User.find(current_user.id) if params[:designer] || params[:coder]
		@user.build_designer_profile if params[:designer]
		@user.build_coder_profile if params[:coder]
		@user.build_answer if @user.present?
	end

	def edit
		@user=User.find(current_user.id)
	end

	def update
		 @user=User.find(current_user.id)
		 params[:id]=@user.id
		 params[:user][:id]=@user.id
		 if @user.update_attributes(params[:user])
		 	redirect_to users_path
		else
			render 'new' 
		end
	end
  
	def check_for_profile

		unless current_user.designer_profile.present? || current_user.coder_profile.present?
		  redirect_to new_user_url
		end

	end

	def get_max_followers
		designer=DesignerProfile.joins(:user).order("twitter_follower_count DESC").first
		coder=CoderProfile.joins(:user).order("twitter_follower_count DESC").first
		return {:designer => designer.user.twitter_follower_count, :coder => coder=CoderProfile.joins(:user).order("twitter_follower_count DESC").first}
	end

end