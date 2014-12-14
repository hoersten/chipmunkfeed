class CitiesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_city, only: [:edit, :update, :destroy]

  # GET /cities
  def index
    @state = State.find(params[:state]).decorate rescue nil
    @county = County.find(params[:state] + '/' + params[:county]).decorate rescue nil if (params[:county].present?)
    @cities = @county.present? ? @county.cities.order(:name) : nil
    @cities ||= @state.present? ? @state.cities.order(:name).decorate : nil
    raise ActionController::RoutingError.new('Not Found') if (@cities.nil?)
  end

  # GET /cities/1
  def show
    @city = City.find(params[:state] + '/' + params[:id]).decorate rescue nil
    raise ActionController::RoutingError.new('Not Found') if (@city.nil?)
  end

  # GET /cities/new
  def new
    @city = City.new
  end

  # GET /cities/1/edit
  def edit
  end

  # POST /cities
  def create
    @city = City.new(city_params)

    respond_to do |format|
      if @city.save
        format.html { redirect_to @city, notice: 'City was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /cities/1
  def update
    respond_to do |format|
      if @city.update(city_params)
        format.html { redirect_to @city, notice: 'City was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /cities/1
  def destroy
    @city.destroy
    respond_to do |format|
      format.html { redirect_to cities_url, notice: 'City was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = City.find(params[:id]) rescue nil
      raise ActionController::RoutingError.new('Not Found') if (@city.nil?)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def city_params
      params.require(:city).permit(:belongs_to, :belongs_to, :name, :latitude, :longtitude, :gnis, :fips, :msa, :usa, :cbsa, :csa, :psa, :dma)
    end

end
