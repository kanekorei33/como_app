class PlaygroundsController < ApplicationController
  before_action :set_playground, only: %i[ show edit update destroy ]

  def index
    @playgrounds = Playground.all
  end

  def show
  end

  def new
    @playground = Playground.new
  end

  def edit
  end

  def create
    @playground = Playground.new(playground_params)
    respond_to do |format|
      if @playground.save
        format.html { redirect_to playground_url(@playground), notice: "Playground が登録されました" }
        format.json { render :show, status: :created, location: @playground }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @playground.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @playground.update(playground_params)
        format.html { redirect_to playground_url(@playground), notice: "Playground が編集されました" }
        format.json { render :show, status: :ok, location: @playground }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @playground.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @playground.destroy
    respond_to do |format|
      format.html { redirect_to playgrounds_url, notice: "Playground が消去されました" }
      format.json { head :no_content }
    end
  end

  private
  def set_playground
    @playground = Playground.find(params[:id])
  end

  def playground_params
    params.require(:playground).permit(:name, :image, :image_cache)
  end
end
