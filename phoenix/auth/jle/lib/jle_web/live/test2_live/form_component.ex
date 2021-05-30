defmodule JleWeb.Test2Live.FormComponent do
  use JleWeb, :live_component

  alias Jle.Test

  @impl true
  def update(%{test2: test2} = assigns, socket) do
    changeset = Test.change_test2(test2)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"test2" => test2_params}, socket) do
    changeset =
      socket.assigns.test2
      |> Test.change_test2(test2_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"test2" => test2_params}, socket) do
    save_test2(socket, socket.assigns.action, test2_params)
  end

  defp save_test2(socket, :edit, test2_params) do
    case Test.update_test2(socket.assigns.test2, test2_params) do
      {:ok, _test2} ->
        {:noreply,
         socket
         |> put_flash(:info, "Test2 updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_test2(socket, :new, test2_params) do
    case Test.create_test2(test2_params) do
      {:ok, _test2} ->
        {:noreply,
         socket
         |> put_flash(:info, "Test2 created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
