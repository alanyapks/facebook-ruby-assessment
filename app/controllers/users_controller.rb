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
	user = User.new(username: params[:username], email: params[:email], password: params[:password])
	if user.save
		session[:user_id] = user.id
		redirect "/users/#{user.id}"
	else
		session[:error] = user.errors.full_messages.first
		redirect "/users/new"
	end
end

#show
#edit
#update
#delete