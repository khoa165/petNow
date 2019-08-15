class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.where(user: current_user)
  end

  def booked
    @pets = Pet.where(user: current_user)
    @bookings = []
    @pets.each do |pet|
      @bookings << Booking.where(pet: pet)
    end
  end

  def show
  end

  def create
    @booking = Booking.new(booking_strong_params)
    @booking.user = current_user
    @pet = Pet.find(params[:pet_id])
    @booking.pet = @pet
    # raise
    # puts "#{@booking.errors.messages}"
    if @booking.save
      redirect_to bookings_path
    else
      puts "failed"
      @booking = Booking.new
      render "pets/show"
    end
  end

  def edit
  end

  def update
    @booking.update(booking_strong_params)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_strong_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
