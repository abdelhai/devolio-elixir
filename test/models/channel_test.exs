defmodule Devolio.ChannelTest do
  use Devolio.ModelCase

  alias Devolio.Channel

  @valid_attrs %{description: "some content", name: "some content", type: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Channel.changeset(%Channel{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Channel.changeset(%Channel{}, @invalid_attrs)
    refute changeset.valid?
  end
end
