defmodule Jle.Repo.Migrations.CreateTest4 do
  use Ecto.Migration

  def change do
    create table(:test4) do
      add :description, :string

      timestamps()
    end

  end
end
