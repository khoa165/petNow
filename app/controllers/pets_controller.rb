class PetsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:search, :show]
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  def index
    @pets = Pet.where(user: current_user)
  end

  def search
    @pets = Pet.geocoded

    @pets = @pets.where.not(user: current_user)

    species_query = params[:species]
    if species_query.present?
      @pets = @pets.where("species ILIKE ?", "%#{species_query}%").limit(20)
    end


    @markers = @pets.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { pet: pet })
      }
    end
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_strong_params)
    @pet.user = current_user
    @pet.save
    redirect_to pets_path
  end

  def edit
  end

  def update
    @pet.update(pet_strong_params)
    redirect_to pets_path
  end

  def show
    @booking = Booking.new
    @reviews = Review.where(pet: @pet)
    @ratings = @reviews.map do |review|
      review.stars
    end
    @sum = 0
    @ratings.each do |rating|
      @sum += rating
    end
    if @ratings.length == 0
      @average_rating = 0
      @leftovers_rating = 5
    else
      @average_rating = (@sum / @ratings.length.to_f)
      @average_rating_rounded = @average_rating.round
      @leftovers_rating = 5 - @average_rating_rounded
    end
  end

  def destroy
    raise
    @pet.destroy
    redirect_to pets_path
  end

  private

  def pet_strong_params
    params.require(:pet).permit(:name, :species, :price_per_day, :age, :category, :photo, :address)
  end

  def set_pet
    @pet = Pet.find(params[:id])
  end
end
