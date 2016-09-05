defmodule Devolio.ChannelUserTest do
  use Devolio.ModelCase

  alias Devolio.ChannelUser

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ChannelUser.changeset(%ChannelUser{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ChannelUser.changeset(%ChannelUser{}, @invalid_attrs)
    refute changeset.valid?
  end
end
