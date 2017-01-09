defmodule SaasExample.User do
  @moduledoc"""
    User model that belongs to an Account
  """
  use SaasExample.Web, :model
  use Coherence.Schema

  schema "users" do
    field :name, :string
    field :email, :string
    field :avatar, :string
    belongs_to :account, SaasExample.Account
    coherence_schema

    timestamps
  end

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:name, :email] ++ coherence_fields)
    |> validate_required([:name, :email])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> validate_confirmation(:password)
    |> validate_coherence(params)
  end
end
