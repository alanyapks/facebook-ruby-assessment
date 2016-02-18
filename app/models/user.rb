class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	has_secure_password
	has_many :posts, dependent: :destroy #delete user will delete all the posts
 	has_many :comments, dependent: :destroy

	validates_presence_of :username, message: "Error: Please input username"
	validates_presence_of :email, message: "Error: Please input email"
	validates_uniqueness_of :email, message: "Error: This email has been used"
	validates_format_of :email, with:/([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})/i, message: "Error: Invalid email format"

	def self.authenticate(email, password)
		@user = User.find_by(email: email)
		if @user && @user.authenticate(password)
			return @user 
		else
			return false
		end
	end

end
