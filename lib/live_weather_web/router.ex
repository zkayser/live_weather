defmodule LiveWeatherWeb.Router do
  use LiveWeatherWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Phoenix.LiveView.Flash
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LiveWeatherWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/weather/:city", WeatherController, :show
    get "/live_weather", WeatherController, :live
  end

  # Other scopes may use custom stacks.
  # scope "/api", LiveWeatherWeb do
  #   pipe_through :api
  # end
end
