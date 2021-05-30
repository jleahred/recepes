defmodule JleWeb.Test44Controller do
  use JleWeb, :controller

  alias Jle.Test4
  alias Jle.Test4.Test44

  def index(conn, _params) do
    test4 = Test4.list_test4()
    render(conn, "index.html", test4: test4)
  end

  def new(conn, _params) do
    changeset = Test4.change_test44(%Test44{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"test44" => test44_params}) do
    case Test4.create_test44(test44_params) do
      {:ok, test44} ->
        conn
        |> put_flash(:info, "Test44 created successfully.")
        |> redirect(to: Routes.test44_path(conn, :show, test44))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    test44 = Test4.get_test44!(id)
    render(conn, "show.html", test44: test44)
  end

  def edit(conn, %{"id" => id}) do
    test44 = Test4.get_test44!(id)
    changeset = Test4.change_test44(test44)
    render(conn, "edit.html", test44: test44, changeset: changeset)
  end

  def update(conn, %{"id" => id, "test44" => test44_params}) do
    test44 = Test4.get_test44!(id)

    case Test4.update_test44(test44, test44_params) do
      {:ok, test44} ->
        conn
        |> put_flash(:info, "Test44 updated successfully.")
        |> redirect(to: Routes.test44_path(conn, :show, test44))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", test44: test44, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    test44 = Test4.get_test44!(id)
    {:ok, _test44} = Test4.delete_test44(test44)

    conn
    |> put_flash(:info, "Test44 deleted successfully.")
    |> redirect(to: Routes.test44_path(conn, :index))
  end
end
