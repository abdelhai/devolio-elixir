defmodule Devolio.User do
  use Devolio.Web, :model

  schema "users" do
    field :email, :string
    field :username, :string
    field :password_hash, :string
    field :password, :string, virtual: true

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :username, :password])
    |> validate_required([:email, :username, :password])
    |> hash_password
  end

  # Encrypts the password provided password
  defp hash_password(changeset) do
    if password = get_field(changeset, :password) do
      changeset
      |> put_change(:password_hash, Comeonin.Bcrypt.hashpwsalt(password))
    else
      changeset
    end
  end

  # Checks if password is valid 
  def valid_creds?(email, password) do
    alias Devolio.Repo
    alias Devolio.User
    case Repo.get_by(User, email: email) do
      nil ->
        {Comeonin.Bcrypt.dummy_checkpw(), nil}
      user ->
        {Comeonin.Bcrypt.checkpw(password, user.password_hash), user}
    end
  end
end
