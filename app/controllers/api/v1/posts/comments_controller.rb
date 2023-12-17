class Api::V1::Posts::CommentsController < Api::V1::ApplicationController
    before_action :set_post


    def index
        @comments = @post.comments
    end

    def create
        @comment = Comment.new(comment_params)
        @comment.post = @post
        @comment.save
    end

    def append_child
        @parent = Comment.find(params[:comment_id])
        @comment_new = Comment.new(comment_params)
        @comment_new.parent = @parent
        @comment_new.post = @post
        @comment_new.save
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:post_id])
    end

    def comment_params
        params.require(:comment).permit(:body, :user_id)
    end
end