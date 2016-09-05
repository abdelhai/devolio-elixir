defmodule Devolio.SpaceTest do
  use Devolio.ModelCase

  alias Devolio.Space

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Space.changeset(%Space{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Space.changeset(%Space{}, @invalid_attrs)
    refute changeset.valid?
  end
end
