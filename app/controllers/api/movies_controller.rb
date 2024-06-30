module Api
  class MoviesController < Api::ApplicationController
    def index
      @movies = Movie.joins(:personas, :accreditations, :reviews).order(avg_rating: :desc).uniq || []
    end
  end
end
