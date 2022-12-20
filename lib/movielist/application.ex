defmodule Movielist.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Movielist.Repo,
      # Start the Telemetry supervisor
      MovielistWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Movielist.PubSub},
      # Start the Endpoint (http/https)
      MovielistWeb.Endpoint
      # Start a worker by calling: Movielist.Worker.start_link(arg)
      # {Movielist.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Movielist.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MovielistWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
