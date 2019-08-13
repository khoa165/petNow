class ReviewsController < ApplicationController
  def pet_reviews
    @reviews = Review.all
  end

  def index
  end
end
