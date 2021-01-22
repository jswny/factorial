import Config

app_name = :factorial

get_env_var = fn var_name, default ->
  value = System.get_env(var_name)

  if value == nil || value == "" do
    if default != :none do
      default
    else
      raise """
      Environment variable #{var_name} is missing!
      """
    end
  else
    value
  end
end

config app_name,
  command_prefix: get_env_var.("COMMAND_PREFIX", "/f")

config app_name, Factorial.Repo,
  database: "factorial_#{config_env()}",
  username: get_env_var.("DATABASE_USERNAME", "postgres"),
  password: get_env_var.("DATABASE_PASSWORD", "postgres"),
  hostname: get_env_var.("DATABASE_HOSTNAME", "localhost")

if config_env() != :test do
  config app_name,
    webhook_id: get_env_var.("DISCORD_WEBHOOK_ID", :none),
    webhook_token: get_env_var.("DISCORD_WEBHOOK_TOKEN", :none)

  config :nostrum,
    token: get_env_var.("DISCORD_BOT_TOKEN", :none)
end
