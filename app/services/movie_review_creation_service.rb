class MovieReviewCreationService
  class MovieNotFound < StandardError; end
  class UserNotProvided < StandardError; end
  class RatingNotProvided < StandardError; end
  class OneStarMinimumRating < StandardError; end
  class ReviewForMovieExists < StandardError; end

  def initialize(user, rating, comment)
    @user = user
    @rating = rating
    @comment = comment
  end

  def review(movie_title)
    movie = Movie.find_by(title: movie_title)
    raise MovieNotFound.new if movie.nil?
    raise UserNotProvided.new if user.nil?
    raise RatingNotProvided.new if rating.nil?
    raise OneStarMinimumRating.new if rating.zero?
    review = movie.reviews.find_or_initialize_by(user: user, rating: rating, comment: comment)
    begin
      review.save! unless review.persisted?
    rescue ActiveRecord::RecordInvalid
      if review.errors.of_kind?(:reviewable_id, :taken) ||
        review.errors.of_kind?(:reviewable_type, :taken) ||
        review.errors.of_kind?(:comment, :taken) ||
        review.errors.of_kind?(:rating, :taken)
        raise ReviewForMovieExists.new
      end
    end
    review
  end

  private

  attr_reader :user, :rating, :comment
end
