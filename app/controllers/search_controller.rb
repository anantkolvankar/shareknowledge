class SearchController < ApplicationController
  def index
    search if params[:search]
  end

  private
    def search
      query = "%#{params[:search]}%"
      @results = {}
      @results[:posts] = Post.where('title LIKE ? or body LIKE ?', query, query)
      @results[:projects] = Project.where('name LIKE ?  or description LIKE ?', query, query)
    end
end
