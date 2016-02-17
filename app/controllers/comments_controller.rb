get "/posts/:post_id/comments/new" do
	@user = current_user
	@post = Post.find(params[:post_id])
	erb :'answer/new'
end

# Create new Comments

post "/posts/:post_id/comments" do
	post = Post.find(params[:post_id])
	comment = post.comments.create(body: params[:body], user_id: current_user.id)
	redirect to "/posts/#{post.id}"
end