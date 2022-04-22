ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(DeliveryApi.Repo, :manual)

Mox.defmock(DeliveryApi.ViaCep.ClientMock, for: DeliveryApi.ViaCep.Behaviour)
