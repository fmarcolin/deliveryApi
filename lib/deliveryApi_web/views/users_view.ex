defmodule DeliveryApiWeb.UsersView do
  use DeliveryApiWeb, :view

  alias DeliveryApi.User

  def render("create.json", %{user: %User{} = user}) do
    %{
      message: "User created!",
      user: user
    }
  end
end
