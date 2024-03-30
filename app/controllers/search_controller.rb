class SearchController < ApplicationController
  
    def index
        @posts = Post.where("title LIKE :query", query: "%#{params[:query]}%")
    end
  
  
  end
  