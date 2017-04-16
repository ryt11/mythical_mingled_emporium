class Admin::OrdersController < Admin::BaseController
  def index
    filter = params[:filter]
    @orders = filter ? Order.where(status: filter) : Order.all
  end
end
