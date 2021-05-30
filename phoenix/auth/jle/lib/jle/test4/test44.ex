defmodule Jle.Test4.Test44 do
  use Ecto.Schema
  import Ecto.Changeset

  schema "test4" do
    field :description, :string

    timestamps()
  end

  @doc false
  def changeset(test44, attrs) do
    test44
    |> cast(attrs, [:description])
    |> validate_required([:description])
  end
end
