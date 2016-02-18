#new
get '/posts/:post_id/comments/new' do
	@user = current_user
	@post = Post.find(params[:post_id])
	erb :"comments/new"
end

#create
post '/posts/:post_id/comments' do
	user = User.find(session[:user_id])
	post = Post.find(params[:post_id])
	@comment = Comment.new(body: params[:comment][:body], user_id: user.id, post_id: post.id)
	if @comment.save
		redirect "/users/#{user.id}/posts/#{post.id}"	
	else
		redirect "/posts/#{post_id}/comments/new"	
	end
end

#index
#show
#edit - get comment edit page
get '/users/:user_id/comments/:comment_id/edit' do
	@user = current_user
	@comment = Comment.find(params[:comment_id])
	erb :"comments/edit"
end

#update
patch '/users/:user_id/comments/:comment_id' do
	@user = User.find(session[:user_id])
	@post = Comment.find(params[:comment_id]).post
	# post = Post.find(params[:post_id])
  @comment = Comment.find(params[:comment_id])
  @comment.update(body: params[:comment][:body])
	redirect "/users/#{@user.id}/posts/#{@post.id}"
end

#delete
delete '/users/:user_id/comments/:comment_id' do
  @user = User.find(session[:user_id])
  @post = Comment.find(params[:comment_id]).post
  @comment = Comment.find(params[:comment_id])
  @comment.destroy
  redirect "/users/#{@user.id}/posts/#{@post.id}"
end