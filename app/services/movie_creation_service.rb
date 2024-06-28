class MovieCreationService
  class MovieTitleExistsForYear < StandardError; end

  def initialize(title, description, year)
    @title = title
    @description = description
    @year = year
  end

  def create
    movie = Movie.find_or_initialize_by(title: title, description: description, year: year)
    begin
      movie.save! unless movie.persisted?
    rescue ActiveRecord::RecordInvalid
      raise MovieTitleExistsForYear.new if movie.errors.of_kind? :title, :taken
    end
    movie
  end

  private

  attr_reader :title, :description, :year
end
