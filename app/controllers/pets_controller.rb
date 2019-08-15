class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  def index
    @pets = Pet.where(user: current_user)
  end

  def search
    species = params[:species].downcase.capitalize
    @pets = Pet.where(species: species)

    @pets_geo = Pet.geocoded #returns pets with coordinates

    @markers = @pets_geo.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude
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
  end

  def destroy
    @pet.destroy
    redirect_to pets_path
  end

  private

  def pet_strong_params
    params.require(:pet).permit(:name, :species, :price_per_day, :age, :category, :photo)
  end

  def set_pet
    @pet = Pet.find(params[:id])
  end
end
