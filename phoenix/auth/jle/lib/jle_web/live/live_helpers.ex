defmodule JleWeb.LiveHelpers do
  import Phoenix.LiveView.Helpers

  @doc """
  Renders a component inside the `JleWeb.ModalComponent` component.

  The rendered modal receives a `:return_to` option to properly update
  the URL when the modal is closed.

  ## Examples

      <%= live_modal @socket, JleWeb.Test2Live.FormComponent,
        id: @test2.id || :new,
        action: @live_action,
        test2: @test2,
        return_to: Routes.test2_index_path(@socket, :index) %>
  """
  def live_modal(socket, component, opts) do
    path = Keyword.fetch!(opts, :return_to)
    modal_opts = [id: :modal, return_to: path, component: component, opts: opts]
    live_component(socket, JleWeb.ModalComponent, modal_opts)
  end
end
