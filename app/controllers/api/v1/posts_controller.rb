class Api::V1::PostsController < Api::V1::ApplicationController
    before_action :set_post, only: %i[ show edit update destroy ]


    def index
        @posts = Post.all
    end
   
    def show
        @comments = @post.comments
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
