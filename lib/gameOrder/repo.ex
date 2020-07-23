defmodule GameOrder.Repo do
  use Ecto.Repo,
    otp_app: :gameOrder,
    adapter: Ecto.Adapters.Postgres
end
