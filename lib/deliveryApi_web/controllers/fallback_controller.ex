defmodule DeliveryApiWeb.FallbackController do
  use DeliveryApiWeb, :controller

  alias DeliveryApiWeb.ErrorView

  def call(conn, {:error, %{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
