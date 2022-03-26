defmodule CharserverTest do
  use ExUnit.Case
  doctest Charserver

  test "greets the world" do
    assert Charserver.hello() == :world
  end
end
