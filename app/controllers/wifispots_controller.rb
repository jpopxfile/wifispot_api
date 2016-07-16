class WifispotsController < ApplicationController
  before_action :set_wifispot, only: [:show, :edit, :update, :destroy]

  # GET /wifispots
  # GET /wifispots.json
  def index
    @wifispots = Wifispot.all
  end

  # GET /wifispots/1
  # GET /wifispots/1.json
  def show
  end

  # GET /wifispots/new
  def new
    @wifispot = Wifispot.new
  end

  # GET /wifispots/1/edit
  def edit
  end

  # POST /wifispots
  # POST /wifispots.json
  def create
    @wifispot = Wifispot.new(wifispot_params)

    respond_to do |format|
      if @wifispot.save
        format.html { redirect_to @wifispot, notice: 'Wifispot was successfully created.' }
        format.json { render :show, status: :created, location: @wifispot }
      else
        format.html { render :new }
        format.json { render json: @wifispot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wifispots/1
  # PATCH/PUT /wifispots/1.json
  def update
    respond_to do |format|
      if @wifispot.update(wifispot_params)
        format.html { redirect_to @wifispot, notice: 'Wifispot was successfully updated.' }
        format.json { render :show, status: :ok, location: @wifispot }
      else
        format.html { render :edit }
        format.json { render json: @wifispot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wifispots/1
  # DELETE /wifispots/1.json
  def destroy
    @wifispot.destroy
    respond_to do |format|
      format.html { redirect_to wifispots_url, notice: 'Wifispot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wifispot
      @wifispot = Wifispot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wifispot_params
      params.require(:wifispot).permit(:spot_id, :name_jp, :name_en, :status, :category, :usable_place, :postcode, :prefecture, :address_jp, :address_en, :tel, :open_time, :ssid, :usable_time, :procedure, :lang_support, :languages, :url, :y_coord, :x_coord, :place_code)
    end
end
