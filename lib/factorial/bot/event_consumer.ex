defmodule Factorial.Bot.EventConsumer do
  @moduledoc false

  require Logger
  alias Factorial.Bot
  alias Factorial.Bot.CommandHandler
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

    content = clean_content(payload.content)

    if payload.author.bot != true && String.contains?(content, Bot.prefix()) do
      CommandHandler.handle_command(content, payload)
    end
  end

  @impl true
  def handle_event(_event) do
    ignore("undefined", "event")
  end

  defp ignore(type, thing) do
    Logger.debug("Ignored #{type} #{thing}")
    :noop
  end

  defp clean_content(content) when is_binary(content) do
    content
    |> String.trim()
  end
end
