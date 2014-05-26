class SearchController < ApplicationController
  def index
    search if params[:search]
  end

  private
    def search
      query = "%#{params[:search]}%"
      @results = {}
      @results[:posts] = Post.where('title ILIKE ? or body ILIKE ?', query, query)
      @results[:projects] = Project.where('name ILIKE ?  or description ILIKE ?', query, query)
    end
end
