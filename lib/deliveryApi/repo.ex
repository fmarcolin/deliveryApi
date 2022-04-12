defmodule DeliveryApi.Repo do
  use Ecto.Repo,
    otp_app: :deliveryApi,
    adapter: Ecto.Adapters.Postgres
end
