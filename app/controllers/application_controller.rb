class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cart
  helper_method :current_user

  def current_user
    return nil unless session[:user_id]
    User.find(session[:user_id].to_i)
  end

  def landing; end

  def set_cart
    @cart = Cart.new(session[:cart])
  end
end
