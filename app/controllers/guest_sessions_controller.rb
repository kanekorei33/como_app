class GuestSessionsController < ApplicationController
  
  def new
    session[:previous_url] = request.referer
  end

  def create
    user = User.find_by(email: 'test@example.com')
    log_in(user)
    flash[:success] = 'ゲストユーザーでログインしました'
    flash[:warning] = 'よろしくお願いします！'
    redirect_to session[:previous_url]
  end
end
