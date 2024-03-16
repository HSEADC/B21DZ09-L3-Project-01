class Api::V1::FeedController < Api::V1::ApplicationController  
    def index
    user = User.find(params[:user_id])    
    @posts = user.feed
    relation = PostLike.where(post_id: @posts.map(&:id), user_id: user.id)
    @post_likes = {}.tap do |hash|      
        relation.each do |like|
        hash[like.post_id] = {          
            liked: like.id,
          likes_count: like.post.likes_count        
        }
      end    
    end
  end
end
