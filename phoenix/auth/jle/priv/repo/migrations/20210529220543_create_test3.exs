defmodule Jle.Repo.Migrations.CreateTest3 do
  use Ecto.Migration

  def change do
    create table(:test3) do
      add :description, :string

      timestamps()
    end

  end
end
