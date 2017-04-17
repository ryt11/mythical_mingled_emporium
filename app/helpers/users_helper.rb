module UsersHelper

  def cancel_link(order)
    if order.paid? || order.ordered?
      link_to "Cancel", order_path(order), method: :put
    end
  end
end
