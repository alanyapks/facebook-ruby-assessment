class Comment < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :user
	belongs_to :post

	validates_presence_of :body, message: "Please insert comment"
end