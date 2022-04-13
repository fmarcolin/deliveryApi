defmodule DeliveryApiWeb.UsersView do
  use DeliveryApiWeb, :view

  alias DeliveryApi.User

  def render("create.json", %{user: %User{} = user}) do
    %{
      message: "User created!",
      user: user
    }
  end

  def render("show.json", %{user: %User{} = user}) do
    %{
      user: user
    }
  end
end
