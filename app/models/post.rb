class Post < ApplicationRecord
	validates :name, :presence => true
	validates :title, :presence => true, :length => { :minimum => 5 }

	has_many :comments, :dependent => :destroy
	mount_uploader :post_image, PostImageUploader
	belongs_to :user
end