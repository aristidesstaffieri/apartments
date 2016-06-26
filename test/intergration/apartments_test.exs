defmodule ApartmentsIntegrationTest do
  use ExUnit.Case, async: true
  use Plug.Test
  alias Apartments.Apartment
  alias Apartments.Router
  alias Apartments.Repo

  @opts Router.init([])
  test 'get all apartments' do
    %Apartment{name: "Something Place Palace", addr: "123 Something Place"} |> Repo.insert!
    apartments = Repo.all(Apartment)
                |> Poison.encode!

    conn = conn(:get, "/api/apartments")
    response = Router.call(conn, @opts)

    assert response.status == 200
    assert response.resp_body == apartments
  end

  @opts Router.init([])
  test 'get one apartment' do
    %Apartment{name: "Something Place 2", addr: "456 Something Place", id: 5} |> Repo.insert!
    apartment = Repo.get!(Apartment, 5)
                |> Poison.encode!

    conn = conn(:get, "api/apartments/5")
    response = Router.call(conn, @opts)

    assert response.status == 200
    assert response.resp_body == apartment
  end
end
