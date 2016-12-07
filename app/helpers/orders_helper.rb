module OrdersHelper
  def trash_link
    newmade_order.present? ? edit_order_path(newmade_order) : orders_path
  end

  def trash_count
    newmade_order&.items&.count.to_i
  end

  private

  def newmade_order
    current_user.orders.newmade.take
  end
end
