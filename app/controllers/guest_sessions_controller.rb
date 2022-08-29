class GuestSessionsController < ApplicationController
  
  def new
    session[:previous_url] = request.referer
  end

  def create
    user = User.find_by(email: 'test@example.com')
    log_in(user)
    flash[:success] = 'ゲストユーザーでログインしました'
    flash[:warning] = 'よろしくお願いします！'
    new_user_redirect_back_or(user)
  end

  def create_admin
    user = User.find_by(email: 'test_admin@example.com')
    log_in(user)
    flash[:success] = 'ゲストユーザー(管理者)でログインしました'
    new_user_redirect_back_or(user)
  end

  private

  def new_user_redirect_back_or(default)
    redirect_to(session[:previous_url] || default)
    session.delete(:previous_url)
  end
end
