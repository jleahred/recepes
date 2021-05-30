defmodule JleWeb.Test44ControllerTest do
  use JleWeb.ConnCase

  alias Jle.Test4

  @create_attrs %{description: "some description"}
  @update_attrs %{description: "some updated description"}
  @invalid_attrs %{description: nil}

  def fixture(:test44) do
    {:ok, test44} = Test4.create_test44(@create_attrs)
    test44
  end

  describe "index" do
    test "lists all test4", %{conn: conn} do
      conn = get(conn, Routes.test44_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Test4"
    end
  end

  describe "new test44" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.test44_path(conn, :new))
      assert html_response(conn, 200) =~ "New Test44"
    end
  end

  describe "create test44" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.test44_path(conn, :create), test44: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.test44_path(conn, :show, id)

      conn = get(conn, Routes.test44_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Test44"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.test44_path(conn, :create), test44: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Test44"
    end
  end

  describe "edit test44" do
    setup [:create_test44]

    test "renders form for editing chosen test44", %{conn: conn, test44: test44} do
      conn = get(conn, Routes.test44_path(conn, :edit, test44))
      assert html_response(conn, 200) =~ "Edit Test44"
    end
  end

  describe "update test44" do
    setup [:create_test44]

    test "redirects when data is valid", %{conn: conn, test44: test44} do
      conn = put(conn, Routes.test44_path(conn, :update, test44), test44: @update_attrs)
      assert redirected_to(conn) == Routes.test44_path(conn, :show, test44)

      conn = get(conn, Routes.test44_path(conn, :show, test44))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, test44: test44} do
      conn = put(conn, Routes.test44_path(conn, :update, test44), test44: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Test44"
    end
  end

  describe "delete test44" do
    setup [:create_test44]

    test "deletes chosen test44", %{conn: conn, test44: test44} do
      conn = delete(conn, Routes.test44_path(conn, :delete, test44))
      assert redirected_to(conn) == Routes.test44_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.test44_path(conn, :show, test44))
      end
    end
  end

  defp create_test44(_) do
    test44 = fixture(:test44)
    %{test44: test44}
  end
end
