import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :date_input, DateInput.Repo,
  username: "postgres",
  password: "postgres",
  database: "date_input_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :date_input, DateInputWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "pO42vfnFwlIl8Lasu9dfORcF+sX6ieTQ+1HMe61e0H0KIOwRbiWbGDff56BI7BUq",
  server: false

# In test we don't send emails.
config :date_input, DateInput.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
