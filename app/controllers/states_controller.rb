class StatesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_state, only: [:show, :edit, :update, :destroy]

  # GET /states
  def index
    @states = State.all.order(:name)
  end

  # GET /states/1
  def show
  end

  # GET /states/new
  def new
    @state = State.new
  end

  # GET /states/1/edit
  def edit
  end

  # POST /states
  def create
    @state = State.new(state_params)

    respond_to do |format|
      if @state.save
        format.html { redirect_to @state, notice: 'State was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /states/1
  def update
    respond_to do |format|
      if @state.update(state_params)
        format.html { redirect_to @state, notice: 'State was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /states/1
  def destroy
    @state.destroy
    respond_to do |format|
      format.html { redirect_to states_url, notice: 'State was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_state
      @state = State.find(params[:id]) rescue nil
      raise ActionController::RoutingError.new('Not Found') if (@state.nil?)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def state_params
      params.require(:state).permit(:name, :abbreviation, :state_id, :fips)
    end

end
