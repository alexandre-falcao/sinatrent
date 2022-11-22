class InstrumentsController < ApplicationController

  def index
    @instruments = Instrument.all
  end

  def new
    @instrument = Instrument.new
  end

  def create
    # @user_id = current_user.id
    # @name = params[:instrument][:name]
    # @instrument_type = params[:instrument][:instrument_type]
    # @price = params[:instrument][:price]
    @instrument = Instrument.new(instrument_params)
    @instrument.user = current_user
    @instrument.save
    redirect_to root_path
  end

  private

  def instrument_params
    params.require(:instrument).permit(:name, :type, :price)
  end

end
