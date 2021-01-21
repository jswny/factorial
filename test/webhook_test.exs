defmodule Factorial.WebhookTest do
  use ExUnit.Case
  alias Factorial.Webhook

  test "get_id retrieves the webhook ID from the environment" do
    value = "id123"
    put_application_env(:webhook_id, value)
    assert ^value = Webhook.get_id()
  end

  test "get_token retrieves the webhook token from the environment" do
    value = "token123"
    put_application_env(:webhook_token, value)
    assert ^value = Webhook.get_token()
  end

  defp put_application_env(key, value) do
    Webhook
    |> Application.get_application()
    |> Application.put_env(key, value)
  end
end
