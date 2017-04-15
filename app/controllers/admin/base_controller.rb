class Admin::BaseController < ApplicationController
  before_action :check_admin

  private

  def current_admin?
    current_user && current_user.admin?
  end

  def check_admin
    render file: 'public/404', status: 404 unless current_admin?
  end
end
