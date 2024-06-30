json.title movie.title
json.description movie.description
json.avg_rating movie.avg_rating

if movie.actors.present?
  json.actors movie.actors.map(&:name)
end

if movie.directors.present?
  json.directors movie.directors&.map(&:name)
end

if movie.filming_locations.present?
  json.filming_locations movie.filming_locations do |filming_location|
    json.partial! "filming_location", filming_location: filming_location
  end
end

if movie.reviews.present?
  json.reviews movie&.reviews do |review|
    json.partial! "review", review: review
  end
end
