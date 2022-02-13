defmodule MoblistappWeb.PageController do
  use MoblistappWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
