defmodule Factorial.Log.Parser do
  @moduledoc false

  def parse_data(data) do
    data
    |> String.split("\n")
    |> Enum.map(&parse_line/1)
    |> Enum.filter(fn result -> result != nil end)
  end

  # 2021-01-19 03:01:49 [CHAT] SadEffort: @Bull
  defp parse_line(line) do
    chat_regex =
      ~r/[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9] [0-9][0-9]:[0-9][0-9]:[0-9][0-9] \[CHAT] (.*): (.*)/

    result = Regex.run(chat_regex, line)

    if result != nil && Enum.count(result) == 3 do
      {:chat, Enum.at(result, 1), Enum.at(result, 2)}
    else
      nil
    end
  end
end
