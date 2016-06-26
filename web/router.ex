defmodule Apartments.Router do
  use Apartments.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Apartments do
    pipe_through :api

    resources "/apartments", ApartmentCntrl, except: [:new, :edit]
  end
end
