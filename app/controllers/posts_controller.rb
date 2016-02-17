#new - get create posts page
get '/posts/new' do
  @user = current_user
  erb :"posts/new"
end

#create
post '/users/:user_id/posts' do
	user = User.find(params[:user_id])
	post = Post.new(text: params[:post][:text], user_id: user.id)
	if post.save
		redirect "/users/#{user.id}/post"	
	else
		redirect "/users/#{user.id}/posts/new"	
	end
end

#index
get '/users/:user_id/post' do
	@user = current_user
  erb :"posts/index"
end

#show
#edit
#update
#delete