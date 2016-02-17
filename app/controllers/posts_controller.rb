# Display new post form
get "/posts/new" do
	@user = current_user
	erb :"post/new"
end

# Create new post
post "/posts" do
	# byebug
	@user = current_user
	@post = Post.new(text: params[:text])
	if @post.save
		redirect to "/posts/#{@post.id}"
	else
		@warning = "Error"
		erb :"post/new"
	end
end

#View all post
get '/posts' do
	@user = User.find(params[:user_id])
  erb :"posts/posts"
end

# View the post
get "/posts/:id" do
	@user = current_user
	@post = post.find(params[:id])
	@answers = @post.answers
	erb :"post/show"
end

# Delete post
delete '/posts/:id' do
	@user = current_user
	post = Post.find(params[:id])
	post.destroy
	erb :"user/posts"
end
