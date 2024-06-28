class SetFilmingLocationService
  class NoFilmableProvided < StandardError; end
  class NoFilmingLocationProvided < StandardError; end
  class FilmSetAlreadyExists < StandardError; end

  def initialize(filming_location)
    @filming_location = filming_location
  end

  def set(filmable)
    raise NoFilmableProvided.new if filmable.nil?
    raise NoFilmingLocationProvided.new if filming_location.nil?
    filmable_filming_location = FilmableFilmingLocation.find_or_initialize_by(filmable: filmable, filming_location: filming_location)
    begin
      filmable_filming_location.save! unless filmable_filming_location.persisted?
    rescue ActiveRecord::RecordInvalid
      raise FilmSetAlreadyExists.new if filmable_filming_location.errors.of_kind? :filming_location, :taken
    end
    filmable.filming_locations
  end

  private

  attr_reader :filming_location
end
