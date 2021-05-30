defmodule JleWeb.Test2LiveTest do
  use JleWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Jle.Test

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  defp fixture(:test2) do
    {:ok, test2} = Test.create_test2(@create_attrs)
    test2
  end

  defp create_test2(_) do
    test2 = fixture(:test2)
    %{test2: test2}
  end

  describe "Index" do
    setup [:create_test2]

    test "lists all test", %{conn: conn, test2: test2} do
      {:ok, _index_live, html} = live(conn, Routes.test2_index_path(conn, :index))

      assert html =~ "Listing Test"
      assert html =~ test2.name
    end

    test "saves new test2", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.test2_index_path(conn, :index))

      assert index_live |> element("a", "New Test2") |> render_click() =~
               "New Test2"

      assert_patch(index_live, Routes.test2_index_path(conn, :new))

      assert index_live
             |> form("#test2-form", test2: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#test2-form", test2: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.test2_index_path(conn, :index))

      assert html =~ "Test2 created successfully"
      assert html =~ "some name"
    end

    test "updates test2 in listing", %{conn: conn, test2: test2} do
      {:ok, index_live, _html} = live(conn, Routes.test2_index_path(conn, :index))

      assert index_live |> element("#test2-#{test2.id} a", "Edit") |> render_click() =~
               "Edit Test2"

      assert_patch(index_live, Routes.test2_index_path(conn, :edit, test2))

      assert index_live
             |> form("#test2-form", test2: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#test2-form", test2: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.test2_index_path(conn, :index))

      assert html =~ "Test2 updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes test2 in listing", %{conn: conn, test2: test2} do
      {:ok, index_live, _html} = live(conn, Routes.test2_index_path(conn, :index))

      assert index_live |> element("#test2-#{test2.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#test2-#{test2.id}")
    end
  end

  describe "Show" do
    setup [:create_test2]

    test "displays test2", %{conn: conn, test2: test2} do
      {:ok, _show_live, html} = live(conn, Routes.test2_show_path(conn, :show, test2))

      assert html =~ "Show Test2"
      assert html =~ test2.name
    end

    test "updates test2 within modal", %{conn: conn, test2: test2} do
      {:ok, show_live, _html} = live(conn, Routes.test2_show_path(conn, :show, test2))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Test2"

      assert_patch(show_live, Routes.test2_show_path(conn, :edit, test2))

      assert show_live
             |> form("#test2-form", test2: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#test2-form", test2: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.test2_show_path(conn, :show, test2))

      assert html =~ "Test2 updated successfully"
      assert html =~ "some updated name"
    end
  end
end
