defmodule SaasExample.PageControllerTest do
  use SaasExample.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "SAAS Example"
  end
end
