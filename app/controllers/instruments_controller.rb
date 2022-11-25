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

    if @instrument.save
      redirect_to instrument_path(@instrument)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @instrument = Instrument.find(params[:id])
    authorize @instrument
  end

  def destroy
    @instrument = Instrument.find(params[:id])
    @instrument.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to instruments_path, status: :see_other
  end

  def edit
    @instrument = Instrument.find(params[:id])
    authorize @instrument
  end

  def update
    @instrument = Instrument.find(params[:id])
    authorize @instrument
    @instrument.update(instrument_params)
    redirect_to instrument_path(@instrument)
  end

  private

  def instrument_params
    params.require(:instrument).permit(:name, :instrument_type, :price, :photo)
  end

end
