class UsersController < ApplicationController
  skip_before_action :login_required, only: %i[new create]
  before_action :set_user, only: %i[show edit update]

  def new
    @user = User.new
  end

  def create
    @user =User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
  #  binding.irb
  @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to parks_path
    end
  end
  
  def update
    @user = User.find(user_params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id),notice: "編集しました！"
    else
      render :edit
    end
  end

  private

  def set_user
    @user =User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :nickname, :email, :password, :password_confirmation, :image, :image_cache)
  end

  def currect_user
    unless User.find(params[:id]).user.id.to_i == current_user.id
      redirect_to pictures_path(current_user)
      flash[:notice] = "権限がありません"
    end
  end
end


