class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :comments
  has_many :post_likes
  has_many :subscriptions, class_name: 'Follower', foreign_key: :subscriber_id
  has_many :followers, class_name: 'Follower', foreign_key: :publisher_id
  has_many :autors, through: :subscriptions, source: :publisher

  mount_uploader :logo, LogoUploader

  
  def recent_popular_post
    recent_post_ids = posts.where(created_at: 1.week.ago..)
    return nil if recent_post_ids.blank?

    Post.where(id: recent_post_ids)
      .select("posts.*, count(post_likes.id) as likes_count")
      .joins('left outer join post_likes on post_likes.post_id = posts.id')
      .order('count(post_likes.id) desc').first
  end

  def feed
    Post.where(user_id: autor_ids).order(created_at: :desc)
  end

  def digest
    autors.map do |autor|
      autor.recent_popular_post
    end.compact
  end
end
