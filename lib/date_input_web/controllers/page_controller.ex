defmodule DateInputWeb.PageController do
  use DateInputWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
