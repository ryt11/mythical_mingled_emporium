class Admin::OrdersController < Admin::BaseController
  def index
    filter = params[:filter]
    @orders = filter ? Order.where(status: filter) : Order.all
  end

  def update
    order = Order.find(params[:id])
    order.update!(status: params[:status])
    redirect_to admin_orders_path
  end
end
