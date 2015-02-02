class CountiesController < ApplicationController
  before_action :set_county, only: [:show]

  # GET /counties
  def index
    @state = State.find(params[:state]).decorate rescue nil
    @counties = @state.present? ? County.where(state: @state).order(:name).decorate : nil
    raise ActionController::RoutingError.new('Not Found') if (@counties.nil?)
  end

  # GET /counties/1
  def show
    @capitals = @county.capitals
    raise ActionController::RoutingError.new('Not Found') if (@county.nil?)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_county
      @state = State.find(params[:state]).decorate rescue nil
      @county   = County.find(params[:id]).decorate rescue nil
      @county ||= County.find(params[:state] + '/' + params[:id]).decorate rescue nil
      raise ActionController::RoutingError.new('Not Found') if (@county.nil?)
    end

end
