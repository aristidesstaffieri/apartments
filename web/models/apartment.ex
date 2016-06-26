defmodule Apartments.Apartment do
  use Apartments.Web, :model

  schema "apartments" do
    field :name, :string
    field :addr, :string

    timestamps
  end

  @required_fields ~w(name addr)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  defimpl Poison.Encoder, for: Apartments.Apartment do
    def encode(apartment, _options) do
      apartment
      |> Map.from_struct
      |> Map.drop([:__meta__, :__struct__])
      |> Poison.encode!
    end
  end
end
