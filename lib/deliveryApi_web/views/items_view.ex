defmodule DeliveryApiWeb.ItemsView do
  use DeliveryApiWeb, :view

  alias DeliveryApi.Item

  def render("create.json", %{item: %Item{} = item}) do
    %{
      message: "Item created!",
      item: item
    }
  end
end
