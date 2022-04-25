defmodule DeliveryApiWeb.OrdersController do
  use DeliveryApiWeb, :controller

  alias DeliveryApi.Order
  alias DeliveryApiWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Order{} = order} <- DeliveryApi.create_order(params) do
      conn
      |> put_status(:created)
      |> render("create.json", order: order)
    end
  end
end
