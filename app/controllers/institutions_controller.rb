class InstitutionsController < ApplicationController
  before_action :set_institution, only: %i[ show edit update destroy ]

  def index
    @institutions = Institution.all
  end

  def show
  end

  def new
    @institution = Institution.new
  end

  def edit
  end

  def create
    @institution = Institution.new(institution_params)

    respond_to do |format|
      if @institution.save
        format.html { redirect_to institution_url(@institution), notice: "施設が登録されました" }
        format.json { render :show, status: :created, location: @institution }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @institution.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @institution.update(institution_params)
        format.html { redirect_to institution_url(@institution), notice: "施設が編集されました" }
        format.json { render :show, status: :ok, location: @institution }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @institution.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @institution.destroy

    respond_to do |format|
      format.html { redirect_to institutions_url, notice: "施設が消去されました" }
      format.json { head :no_content }
    end
  end

  private
  def set_institution
    @institution = Institution.find(params[:id])
  end

  def institution_params
    params.require(:institution).permit(:name, :image, :image_cache)
  end
end
