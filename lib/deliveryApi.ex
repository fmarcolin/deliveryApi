defmodule DeliveryApi do
  alias DeliveryApi.Items.Create, as: ItemCreate

  alias DeliveryApi.Users.Create, as: UserCreate
  alias DeliveryApi.Users.Delete, as: UserDelete
  alias DeliveryApi.Users.Get, as: UserGet
  alias DeliveryApi.Users.Update, as: UserUpdate

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate delete_user(id), to: UserDelete, as: :call
  defdelegate get_user_by_id(id), to: UserGet, as: :by_id
  defdelegate update_user(id), to: UserUpdate, as: :call

  defdelegate create_item(params), to: ItemCreate, as: :call
end
