class MoviesController < ApplicationController
  def index
    # if we have search params from our form
    if params[:query].present?
      # filter Movies by title with the search term
      # @movies = Movie.where("title ILIKE ?", "%#{params[:query]}%")

      # search through our synopsis & titles
      # sql_query = "title ILIKE :query OR synopsis ILIKE :query"
      # @movies = Movie.where(sql_query, query: "%#{params[:query]}%")

      # multiple tables
      # sql_query = " \
      #   movies.title @@ :query \
      #   OR movies.synopsis @@ :query \
      #   OR directors.first_name @@ :query \
      #   OR directors.last_name @@ :query \
      # "
      # @movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%")

      # pg_search
      @movies = Movie.global_search(params[:query])
    else
      @movies = Movie.all
    end
  end
end
