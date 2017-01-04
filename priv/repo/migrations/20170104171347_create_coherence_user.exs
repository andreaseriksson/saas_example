defmodule SaasExample.Repo.Migrations.CreateCoherenceUser do
  use Ecto.Migration
  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :avatar, :string
      # authenticatable
      add :password_hash, :string
      add :account_id, references(:accounts, on_delete: :delete_all)

      timestamps()
    end
    create unique_index(:users, [:email])
    create index(:users, [:account_id])

  end
end
