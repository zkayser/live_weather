defmodule LiveWeather.Api do
  @base_url "https://api.openweathermap.org/data/2.5/weather?q="
  @app_id "&APPID=" <> System.fetch_env!("OPEN_WEATHER_API_KEY")
  @units "&units=imperial"
  def fetch_weather(city \\ "New York") do
    case Tesla.get(@base_url <> URI.encode(city) <> @units <> @app_id) do
      {:ok, resp} -> Jason.decode(resp.body)
      {:error, error} -> IO.inspect(error)
    end
  end
end
