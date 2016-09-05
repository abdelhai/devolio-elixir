defmodule Devolio.Channel do
  use Devolio.Web, :model

  schema "channels" do
    field :name, :string
    field :description, :string
    field :type, :integer
    belongs_to :space, Devolio.Space
    # many_to_many :users, Devolio.User, join_through: Devolio.ChannelUser

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :description, :type])
    # |> cast_assoc(params, [:space])
    |> validate_required([:name, :description, :type])
  end
end
