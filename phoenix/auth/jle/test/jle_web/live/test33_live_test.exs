defmodule JleWeb.Test33LiveTest do
  use JleWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Jle.Test3

  @create_attrs %{description: "some description"}
  @update_attrs %{description: "some updated description"}
  @invalid_attrs %{description: nil}

  defp fixture(:test33) do
    {:ok, test33} = Test3.create_test33(@create_attrs)
    test33
  end

  defp create_test33(_) do
    test33 = fixture(:test33)
    %{test33: test33}
  end

  describe "Index" do
    setup [:create_test33]

    test "lists all test3", %{conn: conn, test33: test33} do
      {:ok, _index_live, html} = live(conn, Routes.test33_index_path(conn, :index))

      assert html =~ "Listing Test3"
      assert html =~ test33.description
    end

    test "saves new test33", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.test33_index_path(conn, :index))

      assert index_live |> element("a", "New Test33") |> render_click() =~
               "New Test33"

      assert_patch(index_live, Routes.test33_index_path(conn, :new))

      assert index_live
             |> form("#test33-form", test33: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#test33-form", test33: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.test33_index_path(conn, :index))

      assert html =~ "Test33 created successfully"
      assert html =~ "some description"
    end

    test "updates test33 in listing", %{conn: conn, test33: test33} do
      {:ok, index_live, _html} = live(conn, Routes.test33_index_path(conn, :index))

      assert index_live |> element("#test33-#{test33.id} a", "Edit") |> render_click() =~
               "Edit Test33"

      assert_patch(index_live, Routes.test33_index_path(conn, :edit, test33))

      assert index_live
             |> form("#test33-form", test33: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#test33-form", test33: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.test33_index_path(conn, :index))

      assert html =~ "Test33 updated successfully"
      assert html =~ "some updated description"
    end

    test "deletes test33 in listing", %{conn: conn, test33: test33} do
      {:ok, index_live, _html} = live(conn, Routes.test33_index_path(conn, :index))

      assert index_live |> element("#test33-#{test33.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#test33-#{test33.id}")
    end
  end

  describe "Show" do
    setup [:create_test33]

    test "displays test33", %{conn: conn, test33: test33} do
      {:ok, _show_live, html} = live(conn, Routes.test33_show_path(conn, :show, test33))

      assert html =~ "Show Test33"
      assert html =~ test33.description
    end

    test "updates test33 within modal", %{conn: conn, test33: test33} do
      {:ok, show_live, _html} = live(conn, Routes.test33_show_path(conn, :show, test33))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Test33"

      assert_patch(show_live, Routes.test33_show_path(conn, :edit, test33))

      assert show_live
             |> form("#test33-form", test33: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#test33-form", test33: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.test33_show_path(conn, :show, test33))

      assert html =~ "Test33 updated successfully"
      assert html =~ "some updated description"
    end
  end
end
