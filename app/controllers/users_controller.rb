class UsersController < ApplicationController

	before_filter :check_for_profile, :except => :new

	def index
	end

	def new
	end

	def check_for_profile
		
		user_profile = false

		if user_profile == false
		redirect_to new_user_url
		end

	end

end