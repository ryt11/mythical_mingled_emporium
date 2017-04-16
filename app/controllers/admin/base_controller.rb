class Admin::BaseController < ApplicationController
  before_action :check_admin

  private

  def check_admin
    render file: 'public/404', status: 404 unless current_admin?
  end
end
