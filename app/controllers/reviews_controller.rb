class ReviewsController < ApplicationController
  before_action { set_title("ReMarkable Reviews") }
  before_action :set_movie

  def index
    @reviews = @movie.reviews
  end

  private

  def set_movie
    @movie = Movie.find_by(id: params[:movie_id])
    redirect_to movies_path, warning: "Movie not found" unless @movie
  end
end
