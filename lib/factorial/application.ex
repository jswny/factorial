defmodule Factorial.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  alias Factorial.Bot

  @impl true
  def start(_type, _args) do
    Logger.info("Starting...")

    children = [
      # Starts a worker by calling: Factorial.Worker.start_link(arg)
      # {Factorial.Worker, arg}
      Bot.Supervisor,
      Factorial.Repo
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Factorial.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
