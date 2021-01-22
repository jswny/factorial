defmodule Factorial.Bot do
  @moduledoc false

  def prefix do
    Application.get_application(__MODULE__)
    |> Application.get_env(:command_prefix)
  end
end
