defmodule DeliveryApi.Users.Create do
  alias DeliveryApi.{Error, Repo, User}
  alias DeliveryApi.ViaCep.Client

  def call(%{"cep" => cep} = params) do
    user_changeset = User.changeset(params)

    with {:ok, %User{}} <- User.build(user_changeset),
         {:ok, _cep_info} <- Client.get_cep_info(cep),
         {:ok, %User{}} = user <- Repo.insert(user_changeset) do
      user
    else
      {:error, %Error{}} = error -> error
      {:error, result} -> {:error, Error.build(:bad_request, result)}
    end
  end
end
