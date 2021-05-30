defmodule JleWeb.SimpleLive do
  use JleWeb, :live_view
  # import Plug.Conn

  @impl true
  # def mount(_params, session, socket) do
  #   # {user_token, conn} = ensure_user_token(socket.private.conn_session)
  #   # user = user_token && Accounts.get_user_by_session_token(user_token)
  #   # assign(conn, :current_user, user)

  #   {:ok,
  #    assign(socket,
  #      debug: "#{inspect(socket |> Map.keys(), pretty: true)}",
  #      debug2: "#{inspect(socket.private.assign_new, pretty: true)}",
  #      debug3: "#{inspect(session, pretty: true)}"
  #    )}
  # end

  def mount(_params, _session, socket) do
    # {user_token, conn} = ensure_user_token(socket.private.conn_session)
    # user = user_token && Accounts.get_user_by_session_token(user_token)
    # assign(conn, :current_user, user)
    # user = get_session(%Conn{private: socket.private}, :user_id)
    {an, _} = socket.private.assign_new
    user = an.current_user.email

    {:ok,
     assign(socket,
       debug: "#{inspect(socket |> Map.keys(), pretty: true)}",
       debug2: "#{inspect(socket.private.assign_new, pretty: true)}",
       debug3: "#{inspect(user, pretty: true)}"
     )}
  end

  # defp ensure_user_token(conn) do
  #   if user_token = get_session(conn, :user_token) do
  #     {user_token, conn}
  #   else
  #     conn = fetch_cookies(conn, signed: [@remember_me_cookie])

  #     if user_token = conn.cookies[@remember_me_cookie] do
  #       {user_token, put_session(conn, :user_token, user_token)}
  #     else
  #       {nil, conn}
  #     end
  #   end
  # end

  # @impl true
  # def handle_event("suggest", %{"q" => query}, socket) do
  #   {:noreply, assign(socket, results: search(query), query: query)}
  # end

  # @impl true
  # def handle_event("search", %{"q" => query}, socket) do
  #   case search(query) do
  #     %{^query => vsn} ->
  #       {:noreply, redirect(socket, external: "https://hexdocs.pm/#{query}/#{vsn}")}

  #     _ ->
  #       {:noreply,
  #        socket
  #        |> put_flash(:error, "No dependencies found matching \"#{query}\"")
  #        |> assign(results: %{}, query: query)}
  #   end
  # end

  # defp search(query) do
  #   if not JleWeb.Endpoint.config(:code_reloader) do
  #     raise "action disabled when not in development"
  #   end

  #   for {app, desc, vsn} <- Application.started_applications(),
  #       app = to_string(app),
  #       String.starts_with?(app, query) and not List.starts_with?(desc, ~c"ERTS"),
  #       into: %{},
  #       do: {app, vsn}
  # end
end
