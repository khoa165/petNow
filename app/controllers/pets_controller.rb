class PetsController < ApplicationController
  before_action :set_pet, only: [:show]

  def index
    @pets = Pet.all
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

  def show
    @pet = Pet.find(params[:id])
    @booking = Booking.new
  end

  private

  def pet_strong_params
    params.require(:pet).permit(:name, :species, :price_per_day, :age, :category)
  end

  def set_pet
    @pet = Pet.find(params[:id])
  end
end
