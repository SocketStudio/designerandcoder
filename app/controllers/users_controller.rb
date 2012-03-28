class UsersController < ApplicationController

	before_filter :check_profile, :except => :new

	def index
	end

	def new
	end

	def check_profile
		
		if true

		redirect_to new_user_url

		else

		end

	end

end