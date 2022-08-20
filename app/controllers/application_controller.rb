class ApplicationController < ActionController::Base
  include SessionsHelper
  #before_action :login_required
  before_action :store_location #userがログイン前にいた場所を覚えておく

  def store_location
    session[:return_to] = request.url
    #user.save[:return_to] = request.url
  end

  #private

  #def login_required
  #  redirect_to new_session_path unless current_user
  #end
end
