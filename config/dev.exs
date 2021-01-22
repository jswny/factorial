import Config

config :factorial, Factorial.Repo,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
