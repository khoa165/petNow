require 'json'
require 'open-uri'

class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    @pet.save
    redirect_to pets_path
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :species, :price_per_day, :age, :category)
  end
end
