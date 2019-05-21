class BookingsController < ApplicationController
  before_action :set_booking, only: [:index, :show, :new, :create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to pet_bookings_path(@booking)
    else
      render :new
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:sitters_id, :pets_id, :start, :end)
  end
end