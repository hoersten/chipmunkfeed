class StatesController < ApplicationController
  before_action :set_state, only: [:show]

  # GET /states
  def index
    @states = State.all.order(:name)
  end

  # GET /states/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_state
      @state = State.find(params[:id]) rescue nil
      raise ActionController::RoutingError.new('Not Found') if (@state.nil?)
    end

end
