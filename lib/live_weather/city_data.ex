defmodule LiveWeather.CityData do
  def load do
    case File.read(__DIR__ <> "/city_data.txt") do
      {:ok, data} -> String.split(data, "\n")
      _ -> ["New York", "Boston", "Cincinnati"]
    end
  end
end
