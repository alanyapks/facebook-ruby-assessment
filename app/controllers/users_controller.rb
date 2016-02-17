#index
#new
get "/users/new" do
	puts "[LOG] Getting /"
	puts "[LOG] Params: #{params.inspect}"
	erb :"users/signup"
end

#create - User is able to create an account (sign up)
post "/users/signup" do
	puts "[LOG] Getting /"
	puts "[LOG] Params: #{params.inspect}"
	user = User.new(params[:user])
	if user.save
		session[:user_id] = user.id
		redirect "/users/#{user.id}"
	else
		session[:error] = user.errors.full_messages.first
		redirect "/users/new"
	end
end


#show - Show user profile

#edit
#update
#delete
#login - User is able to log into an account (sign in)
post  "/users/login" do
	puts "[LOG] Getting /"
	puts "[LOG] Params: #{params.inspect}"

	user = User.authenticate(params[:user][:email], params[:user][:password])
	if user
		session[:user_id] = user.id
		redirect "/"
	else
		redirect "/"
	end
end

#logout - User is able to log out from an account (sign out)
post "/users/logout" do
	puts "[LOG] Getting /"
	puts "[LOG] Params: #{params.inspect}"

	session.clear
	redirect "/"
end 