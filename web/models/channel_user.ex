defmodule Devolio.ChannelUser do
  use Devolio.Web, :model

  schema "channels_users" do
    belongs_to :channel, Devolio.Channel
    belongs_to :user, Devolio.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
