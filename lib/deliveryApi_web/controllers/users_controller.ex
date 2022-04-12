defmodule DeliveryApiWeb.UsersController do
  use DeliveryApiWeb, :controller

  alias DeliveryApi.User
  alias DeliveryApiWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- DeliveryApi.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
