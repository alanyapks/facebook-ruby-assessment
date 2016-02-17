get '/' do
	@user = current_user
	@posts = Post.all
	@comments = Comment.all
  erb :"static/index"
end