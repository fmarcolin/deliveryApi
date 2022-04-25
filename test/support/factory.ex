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

  def cep_info_factory do
    %{
      "bairro" => "Sé",
      "cep" => "01001-000",
      "complemento" => "lado ímpar",
      "ddd" => "11",
      "gia" => "1004",
      "ibge" => "3550308",
      "localidade" => "São Paulo",
      "logradouro" => "Praça da Sé",
      "siafi" => "7107",
      "uf" => "SP"
    }
  end
end
