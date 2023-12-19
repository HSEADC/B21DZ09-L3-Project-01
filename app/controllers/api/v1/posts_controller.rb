class Api::V1::PostsController < Api::V1::ApplicationController
    before_action :set_post, only: %i[ show edit update destroy ]


    def index
        @posts = Post.all
        relation = PostLike.where(post_id: @posts.map(&:id))        
        relation = relation.where(user_id: params[:user_id]) if params[:user_id].present?
        @post_likes = {}.tap do |hash|            
            relation.each do |like|
                hash[like.post_id] = {
                    liked: params[:user_id].present? ? like.id : nil, 
                    likes_count: like.post.likes_count
            }
            end
        end
    end
   
    def show
        @comments = @post.comments
        @liked = @post.post_likes.where(user_id: params[:user_id]).present?
    end

    def create
        @post = Post.new(post_params)
        @post.user = User.first
        @post.save
    end


    private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def post_param
        params.require(:post).permit(:name, :title, :content, :post_image)
    end
end
