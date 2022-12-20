import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :movielist, Movielist.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "movielist_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :movielist, MovielistWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "bw+bfxw8M3mgv2yYjSYNvymKzSnSNUrPolqZf4IVx1Jk7XzYSSGer+DQPWoS2bdn",
  server: false

# In test we don't send emails.
config :movielist, Movielist.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
