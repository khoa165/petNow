class ReviewsController < ApplicationController
  def pet_reviews
    @reviews = Review.where(pet_id: params[:pet_id])
  end

  def index
    @reviews = Review.where(booking_id: params[:booking_id])
  end

  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @pet = @booking.pet
    @review.pet = @pet
    @review.booking = @booking
    @review.save
    redirect_to pet_path(@pet)
  end

  private

  def review_params
    params.require(:review).permit(:stars, :content)
  end
end
