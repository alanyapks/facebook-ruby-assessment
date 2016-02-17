helpers do 
	# This will return the current user, if they exist
	# Replace with code that work with your application
	def current_user
		if session[:user_id]
			@current_user ||= User.find_by_id(session[:user_id])
		end
	end

	# Return true if the current_user exists, false otherwise
	def logged_in?
		!current_user.nil?
	end
end