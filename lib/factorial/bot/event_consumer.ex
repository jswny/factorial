defmodule Factorial.Bot.EventConsumer do
  @moduledoc false

  require Logger
  use Nostrum.Consumer

  def start_link do
    Consumer.start_link(__MODULE__)
  end

  def child_spec(_args) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, []}
    }
  end

  @impl true
  def handle_event({:MESSAGE_CREATE, payload, _ws_state}) do
    Logger.debug("Recieved message: #{payload.content}")
  end

  @impl true
  def handle_event(_event) do
    ignore("undefined", "event")
  end

  defp ignore(type, thing) do
    Logger.debug("Ignored #{type} #{thing}")
    :noop
  end
end
