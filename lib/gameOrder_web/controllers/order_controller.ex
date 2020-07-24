defmodule GameOrderWeb.OrderController do
  use GameOrderWeb, :controller

  alias GameOrder.Orders
  alias GameOrder.Orders.Order

  action_fallback GameOrderWeb.FallbackController

  def index(conn, _params) do
    orders = Orders.list_orders()
    render(conn, "index.json", orders: orders)
  end

  def create(conn, attrs) do
    
    Orders.validate_order(attrs)
    
    with {:ok, %Order{} = order} <- Orders.create_order(Orders.validate_order(attrs))  do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.order_path(conn, :show, order))
      |> render("show.json", order: order)
    end
  end

  def show(conn, %{"id" => id}) do
    order = Orders.get_order!(id)
    render(conn, "show.json", order: order)
  end

  def update(conn, %{"id" => id, "order" => order_params}) do
    order = Orders.get_order!(id)

    with {:ok, %Order{} = order} <- Orders.update_order(order, order_params) do
      render(conn, "show.json", order: order)
    end
  end

  def delete(conn, %{"id" => id}) do
    order = Orders.get_order!(id)

    with {:ok, %Order{}} <- Orders.delete_order(order) do
      send_resp(conn, :no_content, "")
    end
  end
end
