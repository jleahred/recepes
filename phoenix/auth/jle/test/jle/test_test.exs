defmodule Jle.TestTest do
  use Jle.DataCase

  alias Jle.Test

  describe "test" do
    alias Jle.Test.Test2

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def test2_fixture(attrs \\ %{}) do
      {:ok, test2} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Test.create_test2()

      test2
    end

    test "list_test/0 returns all test" do
      test2 = test2_fixture()
      assert Test.list_test() == [test2]
    end

    test "get_test2!/1 returns the test2 with given id" do
      test2 = test2_fixture()
      assert Test.get_test2!(test2.id) == test2
    end

    test "create_test2/1 with valid data creates a test2" do
      assert {:ok, %Test2{} = test2} = Test.create_test2(@valid_attrs)
      assert test2.name == "some name"
    end

    test "create_test2/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Test.create_test2(@invalid_attrs)
    end

    test "update_test2/2 with valid data updates the test2" do
      test2 = test2_fixture()
      assert {:ok, %Test2{} = test2} = Test.update_test2(test2, @update_attrs)
      assert test2.name == "some updated name"
    end

    test "update_test2/2 with invalid data returns error changeset" do
      test2 = test2_fixture()
      assert {:error, %Ecto.Changeset{}} = Test.update_test2(test2, @invalid_attrs)
      assert test2 == Test.get_test2!(test2.id)
    end

    test "delete_test2/1 deletes the test2" do
      test2 = test2_fixture()
      assert {:ok, %Test2{}} = Test.delete_test2(test2)
      assert_raise Ecto.NoResultsError, fn -> Test.get_test2!(test2.id) end
    end

    test "change_test2/1 returns a test2 changeset" do
      test2 = test2_fixture()
      assert %Ecto.Changeset{} = Test.change_test2(test2)
    end
  end
end
