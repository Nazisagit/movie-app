json.movies @movies.each do|movie|
  json.partial! "movie", movie: movie
end
