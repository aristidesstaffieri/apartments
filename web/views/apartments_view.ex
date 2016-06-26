defmodule Apartments.ApartmentCntrlView do
  use Apartments.Web, :view

  def render("index.json", %{apartments: apartments}) do
    apartments
  end

  def render("show.json", %{apartment: apartment}) do
    apartment
  end
end
