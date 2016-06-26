defmodule Apartments.ApartmentCntrl do
  use Apartments.Web, :controller
  alias Apartments.Apartment

  def index(conn, _params) do
    apartments = Repo.all(Apartment)
    render conn, apartments: apartments
  end

  def show(conn, %{"id" => id}) do
    apartment = Repo.get!(Apartment, id)
    render conn, apartment: apartment
  end

end
