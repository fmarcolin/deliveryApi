defmodule DeliveryApiWeb.UsersView do
  use DeliveryApiWeb, :view

  alias DeliveryApi.User

  def render("create.json", %{token: token, user: %User{} = user}) do
    %{
      message: "User created!",
      token: token,
      user: user
    }
  end

  def render("user.json", %{user: %User{} = user}) do
    %{
      user: user
    }
  end

  def render("sign_in.json", %{token: token}) do
    %{
      token: token
    }
  end
end
