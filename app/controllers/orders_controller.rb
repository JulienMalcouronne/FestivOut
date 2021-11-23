class OrdersController < ApplicationController
  def create
  item = Item.find(params[:item_id])
  order  = Order.create!(item: item, item_sku: item.sku, amount: item.price, state: 'pending', user: current_user)

  session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
      name: item.sku,
      images: [item.photo_url],
      amount: item.price_cents,
      currency: 'eur',
      quantity: 1
    }],
    success_url: order_url(order),
    cancel_url: order_url(order)
  )

  order.update(checkout_session_id: session.id)
  redirect_to new_order_payment_path(order)
  end

  def show
    @order = current_user.orders.find(params[:id])
  end
end
