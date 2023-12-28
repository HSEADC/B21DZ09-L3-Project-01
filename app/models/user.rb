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

  def feed  
    publisher_user_ids = publishers.map { |rel| rel.subscriber.id }
    Post.where(user_id: publisher_user_ids).order(created_at: :desc)
  end
end
