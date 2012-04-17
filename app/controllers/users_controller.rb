class UsersController < ApplicationController

	before_filter :check_for_profile, :except => [:new,:update]

	def index
		if current_user.designer_profile.present?
			redirect_to coder_profiles_path, :flash=>flash
		else
			redirect_to designer_profiles_path, :flash=>flash
		end
	end
  
  
	def new

		if current_user.designer_profile.present? || current_user.coder_profile.present?
			redirect_to users_path
			return
		end

		@user=User.find(current_user.id) if params[:designer] || params[:coder]
		@user.build_designer_profile if params[:designer]
		@user.build_coder_profile if params[:coder]
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

end