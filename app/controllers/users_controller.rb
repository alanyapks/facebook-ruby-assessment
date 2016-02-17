#index
#new
get "/users/new" do
	puts "[LOG] Getting /"
	puts "[LOG] Params: #{params.inspect}"
	erb :"users/new"
end

#create - User is able to create an account (sign up)
post "/users/create" do
	puts "[LOG] Getting /"
	puts "[LOG] Params: #{params.inspect}"
	user = User.new(username: params[:username], email: params[:email], password: params[:password])
	if user.save
		session[:user_id] = user.id
		redirect "/users/#{user.id}"
	else
		session[:error] = user.error.full_messages.first
		redirect "/users/new"
	end
end

#show
#edit
#update
#delete