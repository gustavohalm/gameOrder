defmodule GameOrderWeb.OrderView do
  use GameOrderWeb, :view
  alias GameOrderWeb.OrderView

  def render("index.json", %{orders: orders}) do
    %{data: render_many(orders, OrderView, "order.json")}
  end

  def render("show.json", %{order: order}) do
    %{data: render_one(order, OrderView, "order.json")}
  end

  def render("order.json", %{order: order}) do
    %{id: order.id,
      buyer_id: order.buyer_id,
      receiver_id: order.receiver_id,
      game_id: order.game_id,
      order_price: order.order_price,
      status: order.status}
  end
end
