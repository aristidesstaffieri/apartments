defmodule Apartments.ApartmentTest do
  use Apartments.ModelCase

  alias Apartments.Apartment

  @valid_attrs %{addr: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Apartment.changeset(%Apartment{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Apartment.changeset(%Apartment{}, @invalid_attrs)
    refute changeset.valid?
  end
end
