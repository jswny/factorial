defmodule Factorial.Log.Supervisor do
  @moduledoc false

  use Supervisor
  require Logger
  alias Factorial.Log

  def start_link(_opts) do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  @impl true
  def init(_opts) do
    watcher_args = Log.get_watcher_args()

    Logger.info("Starting log watcher for #{Enum.join(watcher_args[:dirs], ",  ")}...")

    children = [
      {Log.Watcher, watcher_args}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
