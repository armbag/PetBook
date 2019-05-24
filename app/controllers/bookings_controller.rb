class BookingsController < ApplicationController
  before_action :set_booking, only: [:index, :show, :create]

  def index
    @bookings = Booking.all
  end

  def new
    @pet = Pet.find(params[:pet_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.sitter = current_user
    @booking.start = params[:start]
    @booking.end = params[:end]
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
