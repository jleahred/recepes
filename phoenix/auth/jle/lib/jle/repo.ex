defmodule Jle.Repo do
  use Ecto.Repo, otp_app: :jle, adapter: Ecto.Adapters.SQLite3

  # use Ecto.Repo,
  #   otp_app: :jle,
  #   adapter: Ecto.Adapters.Postgres
end
