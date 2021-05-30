defmodule JleWeb.Test2Live.Show do
  use JleWeb, :live_view

  alias Jle.Test

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:test2, Test.get_test2!(id))}
  end

  defp page_title(:show), do: "Show Test2"
  defp page_title(:edit), do: "Edit Test2"
end
