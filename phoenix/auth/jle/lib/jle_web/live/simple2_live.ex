defmodule JleWeb.Simple2Live do
  use JleWeb, :live_view
  # import Plug.Conn

  @impl true
  def mount(_params, session, socket) do
    # {user_token, conn} = ensure_user_token(socket.private.conn_session)
    # user = user_token && Accounts.get_user_by_session_token(user_token)
    # assign(conn, :current_user, user)

    {:ok,
     assign(socket,
       debug: "#{inspect(socket |> Map.keys(), pretty: true)}",
       debug2: "#{inspect(socket.private.assign_new, pretty: true)}",
       debug3: "#{inspect(session, pretty: true)}"
     )}
  end
end
