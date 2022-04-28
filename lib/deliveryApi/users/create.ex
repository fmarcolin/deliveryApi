defmodule DeliveryApi.Users.Create do
  alias DeliveryApi.{Error, Repo, User}

  def call(params) do
    cep = Map.get(params, "cep")
    user_changeset = User.changeset(params)

    with {:ok, %User{}} <- User.build(user_changeset),
         {:ok, _cep_info} <- client().get_cep_info(cep),
         {:ok, %User{}} = user <- Repo.insert(user_changeset) do
      user
    else
      {:error, %Error{}} = error -> error
      {:error, result} -> {:error, Error.build(:bad_request, result)}
    end
  end

  defp client do
    :deliveryapi
    |> Application.fetch_env!(__MODULE__)
    |> Keyword.get(:via_cep_adapter)
  end
end
