defmodule DeliveryApi.Repo do
  use Ecto.Repo,
    otp_app: :deliveryapi,
    adapter: Ecto.Adapters.Postgres
end
