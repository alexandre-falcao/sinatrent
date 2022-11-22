class InstrumentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @instruments = policy_scope(Instrument)
  end

  def new
    @instrument = Instrument.new
    authorize @instrument
  end

  def create
    @instrument = Instrument.new(instrument_params)
    @instrument.user = current_user
    authorize @instrument
    @instrument.save
    redirect_to root_path
  end

  def show
    @instrument = Instrument.find(params[:id])
    authorize @instrument
  end

  private

  def instrument_params
    params.require(:instrument).permit(:name, :type, :price)
  end

end
