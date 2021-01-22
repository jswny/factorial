defmodule Factorial.WebhookTest do
  use ExUnit.Case
  alias Factorial.TestUtils
  alias Factorial.Webhook

  test "get_id/0 retrieves the webhook ID from the environment" do
    value = "id123"
    TestUtils.put_application_env(:webhook_id, value)
    assert ^value = Webhook.get_id()
  end

  test "get_token/0 retrieves the webhook token from the environment" do
    value = "token123"
    TestUtils.put_application_env(:webhook_token, value)
    assert ^value = Webhook.get_token()
  end
end
