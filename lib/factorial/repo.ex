defmodule Factorial.Repo do
  @moduledoc false

  use Ecto.Repo,
    otp_app: :factorial,
    adapter: Ecto.Adapters.Postgres
end
