defmodule Jle.Test4 do
  @moduledoc """
  The Test4 context.
  """

  import Ecto.Query, warn: false
  alias Jle.Repo

  alias Jle.Test4.Test44

  @doc """
  Returns the list of test4.

  ## Examples

      iex> list_test4()
      [%Test44{}, ...]

  """
  def list_test4 do
    Repo.all(Test44)
  end

  @doc """
  Gets a single test44.

  Raises `Ecto.NoResultsError` if the Test44 does not exist.

  ## Examples

      iex> get_test44!(123)
      %Test44{}

      iex> get_test44!(456)
      ** (Ecto.NoResultsError)

  """
  def get_test44!(id), do: Repo.get!(Test44, id)

  @doc """
  Creates a test44.

  ## Examples

      iex> create_test44(%{field: value})
      {:ok, %Test44{}}

      iex> create_test44(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_test44(attrs \\ %{}) do
    %Test44{}
    |> Test44.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a test44.

  ## Examples

      iex> update_test44(test44, %{field: new_value})
      {:ok, %Test44{}}

      iex> update_test44(test44, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_test44(%Test44{} = test44, attrs) do
    test44
    |> Test44.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a test44.

  ## Examples

      iex> delete_test44(test44)
      {:ok, %Test44{}}

      iex> delete_test44(test44)
      {:error, %Ecto.Changeset{}}

  """
  def delete_test44(%Test44{} = test44) do
    Repo.delete(test44)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking test44 changes.

  ## Examples

      iex> change_test44(test44)
      %Ecto.Changeset{data: %Test44{}}

  """
  def change_test44(%Test44{} = test44, attrs \\ %{}) do
    Test44.changeset(test44, attrs)
  end
end
