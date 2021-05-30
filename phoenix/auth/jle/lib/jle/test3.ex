defmodule Jle.Test3 do
  @moduledoc """
  The Test3 context.
  """

  import Ecto.Query, warn: false
  alias Jle.Repo

  alias Jle.Test3.Test33

  @doc """
  Returns the list of test3.

  ## Examples

      iex> list_test3()
      [%Test33{}, ...]

  """
  def list_test3 do
    Repo.all(Test33)
  end

  @doc """
  Gets a single test33.

  Raises `Ecto.NoResultsError` if the Test33 does not exist.

  ## Examples

      iex> get_test33!(123)
      %Test33{}

      iex> get_test33!(456)
      ** (Ecto.NoResultsError)

  """
  def get_test33!(id), do: Repo.get!(Test33, id)

  @doc """
  Creates a test33.

  ## Examples

      iex> create_test33(%{field: value})
      {:ok, %Test33{}}

      iex> create_test33(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_test33(attrs \\ %{}) do
    %Test33{}
    |> Test33.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a test33.

  ## Examples

      iex> update_test33(test33, %{field: new_value})
      {:ok, %Test33{}}

      iex> update_test33(test33, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_test33(%Test33{} = test33, attrs) do
    test33
    |> Test33.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a test33.

  ## Examples

      iex> delete_test33(test33)
      {:ok, %Test33{}}

      iex> delete_test33(test33)
      {:error, %Ecto.Changeset{}}

  """
  def delete_test33(%Test33{} = test33) do
    Repo.delete(test33)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking test33 changes.

  ## Examples

      iex> change_test33(test33)
      %Ecto.Changeset{data: %Test33{}}

  """
  def change_test33(%Test33{} = test33, attrs \\ %{}) do
    Test33.changeset(test33, attrs)
  end
end
