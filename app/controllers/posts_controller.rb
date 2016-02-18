#new - get create posts page
get '/posts/new' do
  @user = current_user
  erb :"posts/new"
end

#create - create posts
post '/users/:user_id/posts' do
	user = User.find(params[:user_id])
	post = Post.new(text: params[:post][:text], user_id: user.id)
	if post.save
		redirect "/users/#{user.id}/posts"	
	else
		redirect "/users/#{user.id}/posts/new"	
	end
end

#index - show all posts
get '/users/:user_id/posts' do
	@user = current_user
  erb :"posts/index"
end

#show - show post
get '/users/:user_id/posts/:post_id' do
	@user = current_user
	@post = Post.find(params[:post_id])
	# byebug
	erb :"posts/show" 
end

#edit - get edit post page
get '/users/:user_id/posts/:post_id/edit' do
	@user = current_user
	@post = Post.find(params[:post_id])
	erb :"posts/edit"
end


#update
patch '/users/:user_id/posts/:post_id' do
	@user = current_user
	post = Post.find(params[:post_id])
	post.update(text: params[:post][:text])
	redirect "/users/#{@user.id}/posts/#{post.id}"
end

#delete - delete post
delete '/posts/:post_id' do
	@user = current_user
	@post = Post.find(params[:post_id])
	@post.destroy
	erb :"posts/index"
end
