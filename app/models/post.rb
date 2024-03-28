class Post < ApplicationRecord
	acts_as_taggable_on :tags
	validates :name, :presence => true
	validates :title, :presence => true, :length => { :minimum => 5, :maximum => 63}

	has_many :comments, :dependent => :destroy
	mount_uploader :post_image, PostImageUploader
	belongs_to :user
	has_many :post_likes
	def likes_count 
		post_likes.size
	end
end