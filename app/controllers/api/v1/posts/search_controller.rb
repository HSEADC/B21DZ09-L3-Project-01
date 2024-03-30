class Api::V1::Posts::SearchController < Api::V1::ApplicationController
    before_action :permitted_params
  
    def search
      @posts = Post.where("name LIKE :query", query: "%#{params[:q]}%")
  
      respond_to do |format|
        format.turbo_stream
      end
    end
  
    private
  
    def permitted_params
      params.permit(:q)
    end
  end  