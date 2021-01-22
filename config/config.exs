import Config

config :porcelain,
  goon_warn_if_missing: false

config :factorial,
  ecto_repos: [Factorial.Repo]

import_config "#{Mix.env()}.exs"
