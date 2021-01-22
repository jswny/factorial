Application.ensure_all_started(:ecto)

children = [Factorial.Repo]
opts = [strategy: :one_for_one, name: Factorial.TestSupervisor]
Supervisor.start_link(children, opts)

Ecto.Adapters.SQL.Sandbox.mode(Factorial.Repo, :manual)

ExUnit.start()
