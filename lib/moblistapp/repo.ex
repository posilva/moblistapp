defmodule Moblistapp.Repo do
  use Ecto.Repo,
    otp_app: :moblistapp,
    adapter: Ecto.Adapters.Postgres
end
