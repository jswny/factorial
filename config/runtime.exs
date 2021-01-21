import Config

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

if config_env() != :test do
  config :factorial,
    webhook_id: get_env_var.("DISCORD_WEBHOOK_ID", :none),
    webhook_token: get_env_var.("DISCORD_WEBHOOK_TOKEN", :none)

  config :nostrum,
    token: get_env_var.("DISCORD_BOT_TOKEN", :none)
end
