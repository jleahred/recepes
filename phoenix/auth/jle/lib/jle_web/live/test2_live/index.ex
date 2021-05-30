defmodule JleWeb.Test2Live.Index do
  use JleWeb, :live_view

  alias Jle.Test
  alias Jle.Test.Test2

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :test, list_test())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Test2")
    |> assign(:test2, Test.get_test2!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Test2")
    |> assign(:test2, %Test2{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Test")
    |> assign(:test2, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    test2 = Test.get_test2!(id)
    {:ok, _} = Test.delete_test2(test2)

    {:noreply, assign(socket, :test, list_test())}
  end

  defp list_test do
    Test.list_test()
  end
end
