#login
post '/users/login' do
	@user = User.authenticate(params[:email], params[:password])
	if @user 
		session[:user_id] = @user.id
		# redirect "/users/#{@user.id}"
		redirect "/"
	else
		@warning = "Login failed"
		erb :'users/index'
	end
end

#signup
post "/users/signup" do
	# byebug
	@user = User.new(username: params[:username], email: params[:email], password: params[:password])
	if @user.save
		session[:user_id] = @user.id
		redirect "/users/#{@user.id}"
	else
		@warning = "Sign up failed, invalid or incomplete info, please retry"
		erb :'/users/new'
	end
end

#logout
get '/users/logout' do
	session.clear
	redirect '/'
end

#index - newsletter of all posts
get "/users/posts" do
	@user = current_user
	@posts = Question.where(user_id: session[:user_id])
	erb :'users/posts'
end


#show - show users
get '/users/:user_id' do
	@user = User.find(params[:user_id])
	erb :'users/show'
end

#edit - get edit page
get '/users/:user_id/edit' do
	@user = User.find(params[:user_id])
	erb :'users/edit'
end 

#update - edit user profile
patch '/users/:user_id' do
	user = User.find(params[:user_id])
	user.update(username: params[:username], email: params[:email], password: params[:password])
	redirect "/users/#{user.id}"
end

#delete - delete user
delete '/users/:id' do
	user = User.find(params[:id])
	user.destroy
	erb :'static/index'
end
