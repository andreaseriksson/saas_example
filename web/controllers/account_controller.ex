defmodule SaasExample.AccountController do
  use SaasExample.Web, :controller

  alias SaasExample.{Account, User}

  plug :put_layout, "session.html"

  def new(conn, _params) do
    changeset = Account.changeset(%Account{users: [%User{}]})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"account" => account_params}) do
    changeset = Account.changeset(%Account{}, account_params)

    case Repo.insert(changeset) do
      {:ok, _account} ->
        # conn
        # |> SaasExample.Coherence.SessionController.create()
        conn
        |> put_flash(:info, "Account created successfully.")
        |> redirect(to: page_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
