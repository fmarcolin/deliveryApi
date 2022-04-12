defmodule DeliveryApi do
  alias DeliveryApi.Users.Create, as: UserCreate

  defdelegate create_user(params), to: UserCreate, as: :call
end
