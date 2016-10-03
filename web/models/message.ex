defmodule Devolio.Message do
  use Devolio.Web, :model

  schema "messages" do
    field :body, :string
    belongs_to :user, Devolio.User
    belongs_to :space, Devolio.Space

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:body])
    |> validate_required([:body])
  end
end
