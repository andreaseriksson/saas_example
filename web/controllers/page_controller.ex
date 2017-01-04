defmodule SaasExample.PageController do
  use SaasExample.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
