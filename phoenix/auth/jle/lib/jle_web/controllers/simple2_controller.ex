defmodule JleWeb.Simple2ControllerLive do
  import Plug.Conn
  import Phoenix.LiveView.Controller

  # alias Jle.Accounts
  # alias JleWeb.Router.Helpers, as: Routes

  # def show(conn, %{"id" => thermostat_id}) do
  def show(conn, _) do
    live_render(conn, Simple2Live,
      session: %{
        # "thermostat_id" => id,
        "current_user_id" => get_session(conn, :user_id)
      }
    )
  end
end
