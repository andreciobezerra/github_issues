defmodule CliTest do
  use ExUnit.Case
  doctest(Issues)
  import Issues.CLI, only: [parse_args: 1]

  test ":help returned by option pasing with -h and --help options" do
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test "three values returned if three values given" do
    assert parse_args(["user", "project", "666"]) == {"user", "project", 666}
  end

  test "count is default if two values given" do
    assert parse_args(["user", "project"]) == {"user", "project", 4}
  end
end
