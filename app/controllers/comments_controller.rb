class CommentsController < InheritedResources::Base

  private

    def comment_params
      params.require(:comment).permit(:commenter, :body, :post_id)
    end

end
