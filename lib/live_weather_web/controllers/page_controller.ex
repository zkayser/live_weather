defmodule LiveWeatherWeb.PageController do
  use LiveWeatherWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
