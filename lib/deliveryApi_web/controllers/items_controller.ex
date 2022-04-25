defmodule DeliveryApiWeb.ItemsController do
  use DeliveryApiWeb, :controller

  alias DeliveryApi.Item
  alias DeliveryApiWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Item{} = item} <- DeliveryApi.create_item(params) do
      conn
      |> put_status(:created)
      |> render("create.json", item: item)
    end
  end
end
