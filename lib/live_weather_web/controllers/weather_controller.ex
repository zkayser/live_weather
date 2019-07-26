defmodule LiveWeatherWeb.WeatherController do
  use LiveWeatherWeb, :controller
  alias LiveWeather.Api

  def show(conn, %{"city" => city}) do
    case Api.fetch_weather(city) do
      {:ok, data} ->
        render(conn, "show.html", data: data)

      {:error, error} ->
        IO.inspect("Something went wrong: #{inspect(error)}")
        conn
    end
  end

  def live(conn, _params) do
    live_render(conn, LiveWeatherWeb.LiveWeather, session: %{})
  end
end
