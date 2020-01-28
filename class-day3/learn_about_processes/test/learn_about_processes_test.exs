defmodule LearnAboutProcessesTest do
  use ExUnit.Case
  doctest LearnAboutProcesses

  test "greets the world" do
    assert LearnAboutProcesses.hello() == :world
  end
end
