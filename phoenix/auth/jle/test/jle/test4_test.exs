defmodule Jle.Test4Test do
  use Jle.DataCase

  alias Jle.Test4

  describe "test4" do
    alias Jle.Test4.Test44

    @valid_attrs %{description: "some description"}
    @update_attrs %{description: "some updated description"}
    @invalid_attrs %{description: nil}

    def test44_fixture(attrs \\ %{}) do
      {:ok, test44} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Test4.create_test44()

      test44
    end

    test "list_test4/0 returns all test4" do
      test44 = test44_fixture()
      assert Test4.list_test4() == [test44]
    end

    test "get_test44!/1 returns the test44 with given id" do
      test44 = test44_fixture()
      assert Test4.get_test44!(test44.id) == test44
    end

    test "create_test44/1 with valid data creates a test44" do
      assert {:ok, %Test44{} = test44} = Test4.create_test44(@valid_attrs)
      assert test44.description == "some description"
    end

    test "create_test44/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Test4.create_test44(@invalid_attrs)
    end

    test "update_test44/2 with valid data updates the test44" do
      test44 = test44_fixture()
      assert {:ok, %Test44{} = test44} = Test4.update_test44(test44, @update_attrs)
      assert test44.description == "some updated description"
    end

    test "update_test44/2 with invalid data returns error changeset" do
      test44 = test44_fixture()
      assert {:error, %Ecto.Changeset{}} = Test4.update_test44(test44, @invalid_attrs)
      assert test44 == Test4.get_test44!(test44.id)
    end

    test "delete_test44/1 deletes the test44" do
      test44 = test44_fixture()
      assert {:ok, %Test44{}} = Test4.delete_test44(test44)
      assert_raise Ecto.NoResultsError, fn -> Test4.get_test44!(test44.id) end
    end

    test "change_test44/1 returns a test44 changeset" do
      test44 = test44_fixture()
      assert %Ecto.Changeset{} = Test4.change_test44(test44)
    end
  end
end
