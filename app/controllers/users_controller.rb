class UsersController < ApplicationController

	before_filter :check_for_profile, :except => :new

	def index
		if current_user.designer_profile.present?
			redirect_to coder_profiles_path, :flash=>flash
		else
			redirect_to designer_profiles_path, :flash=>flash
		end
	end
  
  
	def new
	end
  
	def check_for_profile

		unless current_user.designer_profile.present? || current_user.coder_profile.present?
		redirect_to new_user_url
		end

	end

end