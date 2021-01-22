defmodule Factorial.TestUtils do
  @moduledoc false

  def put_application_env(key, value) do
    :factorial
    |> Application.put_env(key, value)
  end
end
