class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.create(park_id: params[:park_id])
    redirect_to park_path(favorite.park_id), notice: "#{favorite.park.name}をお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to park_path(favorite.park_id), notice: "#{favorite.park.name}をお気に入り解除しました"
  end
end
