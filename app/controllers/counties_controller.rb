class CountiesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_county, only: [:edit, :update, :destroy]

  # GET /counties
  def index
    @state = State.find(params[:state]) rescue nil
    @counties = @state.present? ? County.where(state: @state).order(:name) : nil
    raise ActionController::RoutingError.new('Not Found') if (@counties.nil?)
  end

  # GET /counties/1
  def show
    @county = County.find(params[:state] + '/' + params[:id]) rescue nil
    @capitals = @county.capitals
    raise ActionController::RoutingError.new('Not Found') if (@county.nil?)
  end

  # GET /counties/new
  def new
    @county = County.new
  end

  # GET /counties/1/edit
  def edit
  end

  # POST /counties
  def create
    @county = County.new(county_params)

    respond_to do |format|
      if @county.save
        format.html { redirect_to @county, notice: 'County was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /counties/1
  def update
    respond_to do |format|
      if @county.update(county_params)
        format.html { redirect_to @county, notice: 'County was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /counties/1
  def destroy
    @county.destroy
    respond_to do |format|
      format.html { redirect_to counties_url, notice: 'County was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_county
      @county = County.find(params[:id]) rescue nil
      raise ActionController::RoutingError.new('Not Found') if (@county.nil?)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def county_params
      params.require(:county).permit(:name, :type, :county_id, :fips)
    end

end
