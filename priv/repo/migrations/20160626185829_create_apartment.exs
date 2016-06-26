defmodule Apartments.Repo.Migrations.CreateApartment do
  use Ecto.Migration

  def change do
    create table(:apartments) do
      add :name, :string
      add :addr, :string

      timestamps
    end

  end
end
