class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(park_id: params[:park_id])
    redirect_to parks_path, notice: "#{favorite.park.name}をお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to parks_path, notice: "#{favorite.park.name}をお気に入り解除しました"
  end
end
