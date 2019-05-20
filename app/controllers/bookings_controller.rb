class BookingsController < ApplicationController
  before_action :set_booking, only: [:new, :create]


  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end


private

  def set_booking
    @booking = Booking.find(params[:sitters_id])
  end

  def booking_params
    params.require(:booking).permit(:sitters_id, :pets_id, :start, :end)
  end
end
