defmodule GameOrder.OrdersTest do
  use GameOrder.DataCase

  alias GameOrder.Orders

  describe "orders" do
    alias GameOrder.Orders.Order

    @valid_attrs %{buyer_id: 42, game_id: 42, order_price: 120.5, receiver_id: 42, status: true}
    @update_attrs %{buyer_id: 43, game_id: 43, order_price: 456.7, receiver_id: 43, status: false}
    @invalid_attrs %{buyer_id: nil, game_id: nil, order_price: nil, receiver_id: nil, status: nil}

    def order_fixture(attrs \\ %{}) do
      {:ok, order} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Orders.create_order()

      order
    end

    test "list_orders/0 returns all orders" do
      order = order_fixture()
      assert Orders.list_orders() == [order]
    end

    test "get_order!/1 returns the order with given id" do
      order = order_fixture()
      assert Orders.get_order!(order.id) == order
    end

    test "create_order/1 with valid data creates a order" do
      assert {:ok, %Order{} = order} = Orders.create_order(@valid_attrs)
      assert order.buyer_id == 42
      assert order.game_id == 42
      assert order.order_price == 120.5
      assert order.receiver_id == 42
      assert order.status == true
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Orders.create_order(@invalid_attrs)
    end

    test "update_order/2 with valid data updates the order" do
      order = order_fixture()
      assert {:ok, %Order{} = order} = Orders.update_order(order, @update_attrs)
      assert order.buyer_id == 43
      assert order.game_id == 43
      assert order.order_price == 456.7
      assert order.receiver_id == 43
      assert order.status == false
    end

    test "update_order/2 with invalid data returns error changeset" do
      order = order_fixture()
      assert {:error, %Ecto.Changeset{}} = Orders.update_order(order, @invalid_attrs)
      assert order == Orders.get_order!(order.id)
    end

    test "delete_order/1 deletes the order" do
      order = order_fixture()
      assert {:ok, %Order{}} = Orders.delete_order(order)
      assert_raise Ecto.NoResultsError, fn -> Orders.get_order!(order.id) end
    end

    test "change_order/1 returns a order changeset" do
      order = order_fixture()
      assert %Ecto.Changeset{} = Orders.change_order(order)
    end
  end
end
