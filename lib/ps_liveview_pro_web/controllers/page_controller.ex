defmodule PsLiveviewProWeb.PageController do
  use PsLiveviewProWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
