defmodule DateInput.Repo do
  use Ecto.Repo,
    otp_app: :date_input,
    adapter: Ecto.Adapters.Postgres
end
