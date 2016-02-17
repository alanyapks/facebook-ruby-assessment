get '/' do
	@user = current_user
	@posts = Post.all
	@posts = @posts.sort_by{|attribute| attribute[:id]}.reverse
	@comments = Comment.all
  erb :"static/index"
end