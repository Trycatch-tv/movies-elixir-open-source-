defmodule Movies.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      MoviesWeb.Telemetry,
      # Start the Ecto repository
      Movies.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Movies.PubSub},
      # Start Finch
      {Finch, name: Movies.Finch},
      # Start the Endpoint (http/https)
      MoviesWeb.Endpoint
      # Start a worker by calling: Movies.Worker.start_link(arg)
      # {Movies.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Movies.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MoviesWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
