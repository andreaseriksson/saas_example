defmodule SaasExample.Account do
  @moduledoc"""
    Account is the basic entity which all derives from
  """
  use SaasExample.Web, :model

  schema "accounts" do
    field :name, :string
    field :inactivated_at, Ecto.DateTime
    has_many :users, SaasExample.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :inactivated_at])
    |> cast_assoc(:users)
    |> validate_required([:name])
  end

  @doc """
  Registration changeset only used when account is first created
  together with the first user.
  """
  def registration_changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
