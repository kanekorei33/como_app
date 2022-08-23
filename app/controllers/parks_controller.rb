class ParksController < ApplicationController
  before_action :set_park, only: %i[ show edit update destroy ]

  # GET /parks or /parks.json
  def top
    @playgrounds = Playground.all  #施設と遊具の情報を持ってくる
    @institutions = Institution.all
    @parks_search = Park.ransack(params[:q])
    @parks = @parks_search.result
    @parks = @parks.where(park_institutions: Institution.where(institution_id: params[:q][:institution_id])) if params[:q].present? && params[:q][:name].present?
    @parks = @parks.where(park_playgrounds: playground.where(playground_id: params[:q][:playground_id])) if params[:q].present? && params[:q][:name].present?
  end
    
  def index
    @parks = Park.all
  end

  def search
    @q = Park.ransack(params[:q]) # 送られてきたパラメータを元にテーブルからデータを検索する
    @parks = @q.result.includes(:playgrounds, :institutions) # 検索結果をActiveRecord_Relationのオブジェクトに変換
    render :index#park
  end

  # GET /parks/1 or /parks/1.json
  def show
    @favorite = current_user.favorites.find_by(park_id: @park.id) if logged_in?
    @comments = Comment.all
    @category = Category.all
    @q = Comment.ransack(params[:q])
    @comments = @q.result #railsで使える形式に変換
    @comments = Comments.where(Categiry.where(category_id: params[:q][:icategory_id])) if params[:q].present? && params[:q][:name].present?
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
    @park = Park.new(park_params) if logged_in?

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
