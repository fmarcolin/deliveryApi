defmodule DeliveryApi.ViaCep.Client do
  use Tesla

  alias DeliveryApi.Error
  alias Tesla.Env

  plug Tesla.Middleware.JSON

  @base_url "https://viacep.com.br/ws/"

  def get_cep_info(url \\ @base_url, cep) do
    "#{url}#{cep}/json/"
    |> get()
    |> handle_get()
  end

  defp handle_get({:ok, %Env{status: 200, body: %{"erro" => "true"}}}) do
    {:error, Error.build(:not_found, "CEP not found")}
  end

  defp handle_get({:ok, %Env{status: 400}}) do
    {:error, Error.build(:bad_request, "Invalid CEP")}
  end

  defp handle_get({:error, reason}) do
    {:error, Error.build(:bad_request, reason)}
  end

  defp handle_get({:ok, %Env{status: 200, body: body}}) do
    {:ok, body}
  end
end
