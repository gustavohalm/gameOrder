defmodule GameOrder.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :buyer_id, :integer
      add :receiver_id, :integer
      add :game_id, :integer
      add :order_price, :float
      add :status, :boolean, default: false, null: false

      timestamps()
    end

  end
end
