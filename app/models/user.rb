class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :comments
  has_many :post_likes
  has_many :subscribers, class_name: 'Follower', foreign_key: :subscriber_id
  has_many :publishers, class_name: 'Follower', foreign_key: :publisher_id
end
