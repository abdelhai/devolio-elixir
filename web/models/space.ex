defmodule Devolio.Space do
  use Devolio.Web, :model

  schema "spaces" do
    field :name, :string
    has_many :channels, Devolio.Channel

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
