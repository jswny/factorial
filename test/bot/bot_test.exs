defmodule Factorial.BotTest do
  use ExUnit.Case
  alias Factorial.Bot
  alias Factorial.TestUtils

  test "prefix/0 retrieves prefix from the environment" do
    value = "prefix123"
    TestUtils.put_application_env(:command_prefix, value)
    assert ^value = Bot.prefix()
  end
end
