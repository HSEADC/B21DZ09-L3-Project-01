class WelcomeController < ApplicationController
  def index
    @posts = Post.includes(:user).order(created_at: :desc).limit(100)
  end

  def about 
    @sub = Subscription.new
  end

  def contacts
  end
end
