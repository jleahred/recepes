defmodule Jle.Test3Test do
  use Jle.DataCase

  alias Jle.Test3

  describe "test3" do
    alias Jle.Test3.Test33

    @valid_attrs %{description: "some description"}
    @update_attrs %{description: "some updated description"}
    @invalid_attrs %{description: nil}

    def test33_fixture(attrs \\ %{}) do
      {:ok, test33} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Test3.create_test33()

      test33
    end

    test "list_test3/0 returns all test3" do
      test33 = test33_fixture()
      assert Test3.list_test3() == [test33]
    end

    test "get_test33!/1 returns the test33 with given id" do
      test33 = test33_fixture()
      assert Test3.get_test33!(test33.id) == test33
    end

    test "create_test33/1 with valid data creates a test33" do
      assert {:ok, %Test33{} = test33} = Test3.create_test33(@valid_attrs)
      assert test33.description == "some description"
    end

    test "create_test33/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Test3.create_test33(@invalid_attrs)
    end

    test "update_test33/2 with valid data updates the test33" do
      test33 = test33_fixture()
      assert {:ok, %Test33{} = test33} = Test3.update_test33(test33, @update_attrs)
      assert test33.description == "some updated description"
    end

    test "update_test33/2 with invalid data returns error changeset" do
      test33 = test33_fixture()
      assert {:error, %Ecto.Changeset{}} = Test3.update_test33(test33, @invalid_attrs)
      assert test33 == Test3.get_test33!(test33.id)
    end

    test "delete_test33/1 deletes the test33" do
      test33 = test33_fixture()
      assert {:ok, %Test33{}} = Test3.delete_test33(test33)
      assert_raise Ecto.NoResultsError, fn -> Test3.get_test33!(test33.id) end
    end

    test "change_test33/1 returns a test33 changeset" do
      test33 = test33_fixture()
      assert %Ecto.Changeset{} = Test3.change_test33(test33)
    end
  end
end
