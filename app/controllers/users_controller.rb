class UsersController < ApplicationController
  skip_before_action :store_location
  before_action :set_user, only: %i[show edit update]
  action :admin_user

  def new
    @user = User.new
  end

  def create
    @user =User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "ユーザー登録しました"
      new_user_redirect_back_or user_path(@user)
    else
      flash.now[:danger] = "ユーザー登録に失敗しました"
      render :new
    end
  end

  def show
      unless logged_in?
        redirect_to root_path and return
      end
      if current_user != @user
        redirect_to root_path
      end
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: current_user.id).pluck(:park_id)
    @favorite_list = Park.find(favorites)
    @comments = @user.comments
  end

  def edit
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to parks_path
    end
  end
  
  def update
    @user = User.find(params[:id])
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

  def new_user_redirect_back_or(default)
    redirect_to(session[:previous_url] || default)
    session.delete(:previous_url)
  end

  def currect_user
    unless User.find(params[:id]).user.id.to_i == current_user.id
      redirect_to pictures_path(current_user)
      flash[:notice] = "権限がありません"
    end
  end
end


