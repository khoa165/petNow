class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.where(user: current_user)
  end

  def show
  end

  def create
    @booking = Booking.new(booking_strong_params)
    @booking.user = current_user
    @booking.pet = Pet.find(params[:pet_id])
    @booking.save
    redirect_to bookings_path
  end

  def edit
  end

  def update
    @booking.update(booking_strong_params)
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_strong_params
    params.require(:booking).permit(:start_date, :end_date, :total_price)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
