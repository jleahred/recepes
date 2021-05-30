defmodule JleWeb.Test33Live.Index do
  use JleWeb, :live_view

  alias Jle.Test3
  alias Jle.Test3.Test33

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :test3, list_test3())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Test33")
    |> assign(:test33, Test3.get_test33!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Test33")
    |> assign(:test33, %Test33{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Test3")
    |> assign(:test33, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    test33 = Test3.get_test33!(id)
    {:ok, _} = Test3.delete_test33(test33)

    {:noreply, assign(socket, :test3, list_test3())}
  end

  defp list_test3 do
    Test3.list_test3()
  end
end
