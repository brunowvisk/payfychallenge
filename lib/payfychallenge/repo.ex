defmodule Payfychallenge.Repo do
  use Ecto.Repo,
    otp_app: :payfychallenge,
    adapter: Ecto.Adapters.Postgres
end
