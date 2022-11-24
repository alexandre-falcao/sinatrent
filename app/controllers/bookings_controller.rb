class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new]
  before_action :set_instrument, only: %i[new create]

  def new
    @instrument = Instrument.find(params[:instrument_id])
    @booking = Booking.new
    authorize @instrument
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.instrument = @instrument
    @booking.user = current_user
    raise
    @booking.save
    authorize @instrument
    redirect_to instrument_path(@instrument)
  end

  def instrument_available?
    # Achar o instrumentos
    @instrument = Instrument.find(params[:instrument_id])
    # Puxar a tabela de bookings

  end

  private

  def set_instrument
    @instrument = Instrument.find(params[:instrument_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :return_date)
  end

end
