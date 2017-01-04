defmodule SaasExample.Repo.Migrations.CreateAccount do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add :name, :string
      add :inactivated_at, :naive_datetime

      timestamps()
    end
  end
end
