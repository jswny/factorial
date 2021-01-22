defmodule Factorial.Bot.Supervisor do
  @moduledoc false

  use Supervisor
  require Logger
  alias Factorial.Bot

  def start_link(_opts) do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  @impl true
  def init(_opts) do
    Logger.info("Starting bot with command prefix #{Bot.prefix()}...")

    children = [
      Bot.EventConsumer
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
