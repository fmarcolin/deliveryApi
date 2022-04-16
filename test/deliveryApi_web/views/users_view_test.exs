defmodule DeliveryApiWeb.UsersViewTest do
  use DeliveryApiWeb.ConnCase, async: true

  import DeliveryApi.Factory
  import Phoenix.View

  alias DeliveryApiWeb.UsersView

  test "renders create.json" do
    user = build(:user)

    response = render(UsersView, "create.json", user: user)

    expected_response = %{
      message: "User created!",
      user: %DeliveryApi.User{
        address: "Rua teste",
        age: 24,
        cep: "99999999",
        cpf: "12312312312",
        email: "email@teste",
        id: "b819c042-8a3b-4500-bd02-7a9aa55d3b4b",
        inserted_at: nil,
        name: "Felipe",
        password: "123456",
        password_hash: nil,
        updated_at: nil
      }
    }

    assert response == expected_response
  end
end
