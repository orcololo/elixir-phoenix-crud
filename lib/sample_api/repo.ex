defmodule SampleApi.Repo do
  use Ecto.Repo,
    otp_app: :sample_api,
    adapter: Ecto.Adapters.Postgres
end
