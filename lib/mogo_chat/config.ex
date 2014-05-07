# Production
defmodule MogoChat.Config do
  use Phoenix.Config.App

  config :router, port: System.get_env("PORT") || 4000
  config :plugs, code_reload: false
  config :logger, level: :error
end

# Development
defmodule MogoChat.Config.Dev do
  use MogoChat.Config

  config :router, port: System.get_env("PORT") || 4000,
    consider_all_requests_local: true

  config :plugs, code_reload: false
  config :logger, level: :debug
end

# Test
defmodule MogoChat.Config.Test do
  use MogoChat.Config

  config :router, port: System.get_env("PORT") || 8888
  config :plugs, code_reload: true
  config :logger, level: :debug
end
