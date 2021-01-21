defmodule Factorial.Webhook do
  @moduledoc false

  def get_token do
    get_application()
    |> Application.get_env(:webhook_token)
  end

  def get_id do
    get_application()
    |> Application.get_env(:webhook_id)
  end

  defp get_application do
    Application.get_application(__MODULE__)
  end
end
