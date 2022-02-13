defmodule Moblistapp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Moblistapp.Repo,
      # Start the Telemetry supervisor
      MoblistappWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Moblistapp.PubSub},
      # Start the Endpoint (http/https)
      MoblistappWeb.Endpoint
      # Start a worker by calling: Moblistapp.Worker.start_link(arg)
      # {Moblistapp.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Moblistapp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MoblistappWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
