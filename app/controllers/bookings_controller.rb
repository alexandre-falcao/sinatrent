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

    #array_bookings = Booking.all

    #bookings = false

    # array_bookings.each do |booking|
    #   range = (booking[:start_date]..booking[:return_date])

    #   range_user = (@booking[:start_date]..@booking[:return_date])

    #   if range_user.overlaps?range
    #     bookings = true
    #     redirect_to instruments_path
    #   end
    # end

    #if bookings == false
    @booking.instrument = @instrument
    @booking.user = current_user

    @booking.save
    authorize @instrument
    redirect_to instrument_path(@instrument)
    #end
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
