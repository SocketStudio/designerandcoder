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

end
