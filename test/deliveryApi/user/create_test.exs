defmodule DeliveryApi.Users.CreateTest do
  use DeliveryApi.DataCase, async: true

  import DeliveryApi.Factory
  import Mox

  alias DeliveryApi.{Error, User}
  alias DeliveryApi.Users.Create
  alias DeliveryApi.ViaCep.ClientMock

  describe "call/1" do
    test "when all params are valid, returns the user" do
      params = build(:user_params)

      expect(ClientMock, :get_cep_info, fn _cep ->
        {:ok, build(:cep_info)}
      end)

      response = Create.call(params)

      assert {:ok, %User{id: _id, age: 24, email: "email@teste"}} = response
    end

    test "when there are invalid params, returns an error" do
      params = build(:user_params, %{"age" => 14, "password" => "123"})

      response = Create.call(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["should be at least 6 character(s)"]
      }

      assert {:error, %Error{status: :bad_request, result: changeset}} = response
      assert errors_on(changeset) == expected_response
    end
  end
end
