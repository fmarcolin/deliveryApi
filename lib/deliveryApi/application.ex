defmodule DeliveryApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      DeliveryApi.Repo,
      # Start the Telemetry supervisor
      DeliveryApiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: DeliveryApi.PubSub},
      # Start the Endpoint (http/https)
      DeliveryApiWeb.Endpoint,
      # Start a worker by calling: DeliveryApi.Worker.start_link(arg)
      # {DeliveryApi.Worker, arg}

      DeliveryApi.Orders.ReportRunner
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: DeliveryApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DeliveryApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
