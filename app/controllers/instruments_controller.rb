class InstrumentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @instruments = policy_scope(Instrument)

    @instruments = Instrument.order(created_at: :asc)

    if params[:query].present?
      sql_query = <<~SQL
        instruments.name ILIKE :query
        OR instruments.district ILIKE :query
        OR instruments.city ILIKE :query
        OR categories.name ILIKE :query
      SQL
      @instruments = Instrument.joins(:category).where(sql_query, query: "%#{params[:query]}%")
    else
      @instruments = Instrument.all
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'list', locals: { instruments: @instruments }, formats: [:html] }
    end

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

    @markers =
      {
        lat: @instrument.latitude,
        lng: @instrument.longitude,
        # info_window: render_to_string(partial: "info_window", locals: {instrument: instrument})
        info_window: render_to_string(partial: "info_window", :formats => [:html], locals: {instrument: @instrument})
      }
  end

  def destroy
    @instrument = Instrument.find(params[:id])
    authorize @instrument
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
    params.require(:instrument).permit(:name, :description, :street, :number, :district, :city, :state, :category_id, :price, :photo)
  end

end
