class ParksController < ApplicationController
  before_action :set_park, only: %i[ show edit update destroy ]

  # GET /parks or /parks.json
  def index
    @parks = Park.all
  end

  # GET /parks/1 or /parks/1.json
  def show
    @favorite = current_user.favorites.find_by(park_id: @park.id) if logged_in?
  end

  # GET /parks/new
  def new
    @park = Park.new
  end

  # GET /parks/1/edit
  def edit
  end

  # POST /parks or /parks.json
  def create
    @park = current_user.parks.build(park_params) if logged_in?

    respond_to do |format|
      if @park.save
        format.html { redirect_to park_url(@park), notice: "Park was successfully created." }
        format.json { render :show, status: :created, location: @park }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @park.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parks/1 or /parks/1.json
  def update
    respond_to do |format|
      if @park.update(park_params)
        format.html { redirect_to park_url(@park), notice: "Park was successfully updated." }
        format.json { render :show, status: :ok, location: @park }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @park.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parks/1 or /parks/1.json
  def destroy
    @park.destroy

    respond_to do |format|
      format.html { redirect_to parks_url, notice: "Park was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_park
      @park = Park.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def park_params
      params.require(:park).permit(:name, :introduction, :address, :prefecture, :latitude, :longitude, :main_image, :sub_image1, :sub_image2,
                                   :sub_image3, :sub_image4, :sub_image5, :sub_image6, :sub_image7, :sub_image8, :sub_image9, :sub_image10,
                                   :sub_image11, :image_cache, :user, :user_id, { playground_ids: [] },{ institution_ids: [] })
    end
end
