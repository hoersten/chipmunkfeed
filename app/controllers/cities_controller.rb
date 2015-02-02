class CitiesController < ApplicationController
  before_action :set_city, only: [:show]

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
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @state = State.find(params[:state]).decorate rescue nil
      @city = City.find(params[:state] + '/' + params[:id]).decorate rescue nil
      raise ActionController::RoutingError.new('Not Found') if (@city.nil?)
    end

end
