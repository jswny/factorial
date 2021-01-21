defmodule Factorial.Bot.CommandHandler do
  @moduledoc false

  alias Factorial.Bot
  alias Nostrum.Api

  def handle_command(command, %{channel_id: channel_id} = context)
      when is_binary(command) and is_map(context) do
    raw_command = String.replace_leading(command, "#{Bot.prefix()} ", "")

    case raw_command do
      "ping" -> Api.create_message!(channel_id, "Pong!")
      _ -> nil
    end
  end
end
