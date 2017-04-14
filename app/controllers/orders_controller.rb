class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    user = User.find(session[:user_id].to_i)

    order = user.orders.create(total: @cart.total_price.to_s)

    @cart.contents.each do |id, quantity|
      order.order_creatures.create(creature: Creature.find(id),
                                   quantity: quantity)
    end

    flash[:success] = 'Order was successfully placed'

    redirect_to orders_path
  end
end
