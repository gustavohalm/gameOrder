defmodule GameOrder.Orders.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :buyer_id, :integer
    field :game_id, :integer
    field :order_price, :float
    field :receiver_id, :integer
    field :status, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:buyer_id, :receiver_id, :game_id, :order_price, :status])
    |> validate_required([:buyer_id, :receiver_id, :game_id, :order_price, :status])
  end
end
