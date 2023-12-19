class Api::V1::Posts::LikesController < Api::V1::ApplicationController  
  before_action :set_post
    def create
      @like = PostLike.find_or_create_by(post_id: @post.id, user_id: params[:user_id])
    end
    def destroy    
        @like = PostLike.find_by(id: params[:id])
        @like.destroy! if @like.present?  
    end
    private

    # Use callbacks to share common setup or constraints between actions.  
    def set_post
      @post = Post.find(params[:post_id]) 
    end
  end
  