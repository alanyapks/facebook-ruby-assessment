class Post < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	# Association
	belongs_to :user
	has_many :comments, dependent: :destroy #if destroy the post comments will dissapear

	validates_presence_of :text, message: "Post can't be blank"
end
