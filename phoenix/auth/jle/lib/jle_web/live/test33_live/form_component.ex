defmodule JleWeb.Test33Live.FormComponent do
  use JleWeb, :live_component

  alias Jle.Test3

  @impl true
  def update(%{test33: test33} = assigns, socket) do
    changeset = Test3.change_test33(test33)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"test33" => test33_params}, socket) do
    changeset =
      socket.assigns.test33
      |> Test3.change_test33(test33_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"test33" => test33_params}, socket) do
    save_test33(socket, socket.assigns.action, test33_params)
  end

  defp save_test33(socket, :edit, test33_params) do
    case Test3.update_test33(socket.assigns.test33, test33_params) do
      {:ok, _test33} ->
        {:noreply,
         socket
         |> put_flash(:info, "Test33 updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_test33(socket, :new, test33_params) do
    case Test3.create_test33(test33_params) do
      {:ok, _test33} ->
        {:noreply,
         socket
         |> put_flash(:info, "Test33 created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
