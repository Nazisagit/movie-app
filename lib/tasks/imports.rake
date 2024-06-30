namespace :imports do
  desc "Import movie and review data"
  task import_movie_and_review_data: :environment do
    movies = CSV.parse(File.read("lib/assets/movies (1).csv"), headers: true)
    movies.each do |movie|
      title = movie[0]
      description = movie[1]
      year = movie[2]
      director = movie[3]
      actor = movie[4]
      location_name = movie[5]
      country = movie[6]

      director_persona = PersonaCreationService.new(director).create
      actor_persona = PersonaCreationService.new(actor).create

      movie_creation_service = MovieCreationService.new(title, description, year)
      movie_record = movie_creation_service.create

      director_crediting_service = CreditingService.new(director_persona)
      director_crediting_service.accredit(movie_record, :director)

      actor_crediting_service = CreditingService.new(actor_persona)
      actor_crediting_service.accredit(movie_record, :actor)

      filming_location_creation_service = FilmingLocationCreationService.new(location_name, country)
      filming_location = filming_location_creation_service.create

      filming_location_creation_service = SetFilmingLocationService.new(filming_location)
      filming_location_creation_service.set(movie_record)
    end

    reviews = CSV.parse(File.read("lib/assets/reviews (1).csv"), headers: true)
    reviews.each do |review|
      movie = review[0]
      name = review[1]
      rating = review[2]
      comment = review[3]

      user = UserCreationService.new(name).create

      review_filmable_service = MovieReviewCreationService.new(user, rating.to_i, comment)
      review_filmable_service.review(movie)
    end
  end
end
