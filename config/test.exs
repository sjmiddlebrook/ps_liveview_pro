import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :ps_liveview_pro, PsLiveviewPro.Repo,
  username: "jackmiddlebrook",
  password: "",
  database: "ps_liveview_pro_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ps_liveview_pro, PsLiveviewProWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "qPoZm6j3xUlX7O1rHdunm4Uh6HRBwazcfLKYWrGG6lKFI9Z+mgaqoR6r8AeGp3pw",
  server: false

# In test we don't send emails.
config :ps_liveview_pro, PsLiveviewPro.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
