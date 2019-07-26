defmodule LiveWeatherWeb.LiveWeather do
  use Phoenix.LiveView
  alias LiveWeather.Api

  @cities LiveWeather.CityData.load()

  def mount(_session, socket) do
    send(self(), :start_timer)
    {:ok, assign_data(socket, @cities, "Chicago")}
  end

  def handle_info(:start_timer, socket) do
    :timer.send_interval(5_000, :next_city)
    {:noreply, socket}
  end

  def handle_info(:next_city, %{assigns: %{cities: [next_city | tail]}} = socket) do
    {:noreply, assign_data(socket, tail, next_city)}
  end

  def handle_info(:next_city, %{assigns: %{cities: []}} = socket) do
    {:noreply, assign_data(socket, @cities, hd(@cities))}
  end

  def render(assigns) do
    Phoenix.View.render(LiveWeatherWeb.WeatherView, "live_weather.html", assigns)
  end

  defp assign_data(socket, cities, current_city) do
    case Api.fetch_weather(current_city) do
      {:ok, data} ->
        socket
        |> assign(:cities, cities)
        |> assign(:current_city, current_city)
        |> assign(:data, data)

      _ ->
        socket
    end
  end
end
