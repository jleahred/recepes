defmodule Jle.Test3.Test33 do
  use Ecto.Schema
  import Ecto.Changeset

  schema "test3" do
    field :description, :string

    timestamps()
  end

  @doc false
  def changeset(test33, attrs) do
    test33
    |> cast(attrs, [:description])
    |> validate_required([:description])
  end
end
