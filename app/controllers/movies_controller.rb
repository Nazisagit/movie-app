class MoviesController < ApplicationController
  before_action -> { set_title("ReMarkable Movies") }

  def index
    @movies = Movie.joins(:personas, :accreditations)
      .where("personas.name LIKE ?", "%#{params[:query]}%")
      .where(accreditations: { accreditation_type: :actor})
      .order(avg_rating: :desc).uniq
  end
end
