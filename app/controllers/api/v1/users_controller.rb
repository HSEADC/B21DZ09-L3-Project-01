class Api::V1::UsersController < Api::V1::ApplicationController  
    def follow
    subscriber = User.find(params[:user_id])    
    publisher = User.find(params[:follower_id])
    @relation = Follower.new(subscriber: subscriber, publisher: publisher)
    render status: :no_content and return if @relation.save
    render status: :unprocessable_entity
  end
  def unfollow    
    @relation = Follower.find_by(subscriber: params[:user_id], publisher_id: params[:follower_id])
    @relation.destroy if @relation
  end
end