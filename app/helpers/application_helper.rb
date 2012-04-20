module ApplicationHelper

	def add_error_class(model,nested_model,field)
		

		error_handling(model,nested_model,field,:class)
		
	end

	def error_handling(model,nested_model,field,type)
		#We don't know which nested model we need to pull errors from
		#so send allows you to do dynamic method calling
		#e.g. @user.send(:designer_profile) == @user.designer_profile

		#alias the method if there is a nested model so can call it directly later
		
		@model=model.send(nested_model) unless nested_model.nil?
		@model=model if nested_model.nil?

		if @model.errors.messages[field] && type==:class
			return "error"
		end
		
		if @model.errors.messages[field] && type==:msg
			msg=""
			@model.errors.messages[field].each do |error|
				msg="<p class='help-block'>#{error}</p>"
			end
			return msg.html_safe
		end
	end

	def add_error_message (model,nested_model,field)

		error_handling(model,nested_model,field,:msg)
	end

	def current_user_icon
		#check to see if current_user_icon has been previously called.
		#no need to regenerate if we already know it
		if @current_user_icon.nil?
			img = current_user.twitter_profile_image_url
			#find the type of the logged in user
			type = current_user.designer_profile.present? ? :designer : :coder
			@current_user_icon=profile_icon img, type
		end

		return @current_user_icon

	end

	def profile_icon (img, type)
		#choose which code to return depending on the type
		return type == :designer ? circle_icon(img).html_safe : octagon_icon(img).html_safe
	end

	def circle_icon (img)
		return image_tag img, :class => 'circle'
	end

	def octagon_icon (img)
		return "<div class='hexagon' style='background-image: url(#{img})'>
					<span class='top'></span>
					<span class='middle'></span>
					<span class='bottom'></span>
				</div><!-- end hexagon -->"
		
	end

end
