# Display new post form
get "/posts/new" do
	@user = current_user
	erb :"post/new"
end

# Create new post

post "/posts" do
	# byebug
	@user = current_user
	@post = Post.new(text: params[:text], user_id: session[:user_id])

	if @post.save
		# erb :"/user/posts"
		redirect to "/posts/#{@post.id}"
	else
		@warning = "Action failed, invalid or incomplete info, please retry"
		erb :"post/new"
	end
end

# View the post

get "/posts/:id" do
	@user = current_user
	@post = post.find(params[:id])
	@answers = @post.answers
	erb :'post/show'
end

# Delete post

delete '/posts/:id' do
	@user = current_user
	post = Post.find(params[:id])
	post.destroy
	erb :'user/posts'
end
