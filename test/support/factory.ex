defmodule DeliveryApi.Factory do
  use ExMachina.Ecto, repo: DeliveryApi.Repo

  alias DeliveryApi.User

  def user_params_factory do
    %{
      "address" => "Rua teste",
      "age" => 24,
      "cep" => "99999999",
      "cpf" => "12312312312",
      "email" => "email@teste",
      "name" => "Felipe",
      "password" => "123456"
    }
  end

  def user_factory do
    %User{
      address: "Rua teste",
      age: 24,
      cep: "99999999",
      cpf: "12312312312",
      email: "email@teste",
      name: "Felipe",
      password: "123456",
      id: "b819c042-8a3b-4500-bd02-7a9aa55d3b4b"
    }
  end
end
