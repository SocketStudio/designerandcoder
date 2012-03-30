class UsersController < ApplicationController

	before_filter :check_for_profile, :except => :new

	def index
	end

	def new
	end

	def check_for_profile

		unless current_user.designer_profile.present?
		redirect_to new_user_url
		end

	end

end