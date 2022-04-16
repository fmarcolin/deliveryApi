defmodule DeliveryApiWeb.UsersControllerTest do
  use DeliveryApiWeb.ConnCase, async: true

  import DeliveryApi.Factory

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      params = build(:user_params)

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "User created!",
               "user" => %{
                 "address" => "Rua teste",
                 "age" => 24,
                 "cpf" => "12312312312",
                 "email" => "email@teste",
                 "id" => _id,
                 "name" => "Felipe"
               }
             } = response
    end

    test "when there is some error, return the error", %{conn: conn} do
      params = build(:user_params, %{"age" => 14, "cpf" => nil})

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{
        "message" => %{
          "age" => ["must be greater than or equal to 18"],
          "cpf" => ["can't be blank"]
        }
      }

      assert response == expected_response
    end
  end

  describe "delete/2" do
    test "when there is a user with the given id, deletes the user", %{conn: conn} do
      id = "b819c042-8a3b-4500-bd02-7a9aa55d3b4b"
      insert(:user)

      response =
        conn
        |> delete(Routes.users_path(conn, :delete, id))
        |> response(:no_content)

      expected_response = ""

      assert response == expected_response
    end
  end
end
