defmodule SaasExample.Account do
  @moduledoc"""
    Account is the basic entity which all derives from
  """
  use SaasExample.Web, :model

  schema "accounts" do
    field :name, :string
    field :inactivated_at, Ecto.DateTime

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :inactivated_at])
    |> validate_required([:name])
  end
end
