class SessionsController < ApplicationController
  skip_before_action :store_location
  skip_before_action :login_required, only: %i[new create]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_back_or root_url
    else
      flash.now[:dangre] = "ログインに失敗しました"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = "ログアウトしました"
    redirect_to new_session_path
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end
end
