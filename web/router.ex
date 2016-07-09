defmodule Apartments.Router do
  use Apartments.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :api_auth do
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
  end

  scope "/api", Apartments do
    pipe_through [:api, :api_auth]

    resources "/apartments", ApartmentCntrl, except: [:new, :edit]
  end
end
