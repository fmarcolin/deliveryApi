defmodule DeliveryApi.ViaCep.Behaviour do
  alias DeliveryApi.Error

  @callback get_cep_info(String.t()) :: {:ok, map()} | {:error, Error.t()}
end
