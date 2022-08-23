class ApplicationController < ActionController::Base
  include SessionsHelper
  #before_action :login_required
  before_action :store_location #userがログイン前にいた場所を覚えておく
  before_action :admin_required, if: :admin_url?

  def store_location
    session[:return_to] = request.url
    #user.save[:return_to] = request.url
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
    #notice: "管理者以外はアクセスできません"
  end

  private

  def admin_url?
    request.fullpath.include?("/admin")
  end

  def admin_required
    redirect_to request.url.sub(/admin.*/, ""), notice: "管理者以外はアクセス不可！" unless current_user.admin?
  end
end
