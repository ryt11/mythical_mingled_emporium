class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = 'Login successful'

      redirect_to current_admin? ? admin_dashboard_path : dashboard_path
    else
      flash.now[:failure] = 'Login failed'

      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
