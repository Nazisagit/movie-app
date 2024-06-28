class FilmingLocationCreationService
  class LocationNameNotUniqueToCountry < StandardError; end

  def initialize(location_name, country)
    @location_name = location_name
    @country = country
  end

  def create
    filming_location = FilmingLocation.find_or_initialize_by(name: location_name, country: country)
    begin
      filming_location.save! unless filming_location.persisted?
    rescue ActiveRecord::RecordInvalid
      debugger
      raise LocationNameNotUniqueToCountry.new if filming_location.errors.of_kind? :name, :taken
    end
    filming_location
  end

  private

  attr_reader :location_name, :country
end
