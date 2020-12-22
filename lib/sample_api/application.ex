defmodule SampleApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      SampleApi.Repo,
      # Start the Telemetry supervisor
      SampleApiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: SampleApi.PubSub},
      # Start the Endpoint (http/https)
      SampleApiWeb.Endpoint
      # Start a worker by calling: SampleApi.Worker.start_link(arg)
      # {SampleApi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SampleApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    SampleApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
