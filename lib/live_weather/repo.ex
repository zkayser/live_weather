defmodule LiveWeather.Repo do
  use Ecto.Repo,
    otp_app: :live_weather,
    adapter: Ecto.Adapters.Postgres
end
