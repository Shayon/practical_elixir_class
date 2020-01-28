defmodule CountingServerTest do
  use ExUnit.Case

  test "start_link/0 creates new linked process" do
    {:ok, pid} = CountingServer.start_link()
    assert self() != pid
    assert Process.alive?(pid)
    {:links, links} = Process.info(self(), :links)
    assert pid in links
  end

  test "start_link/0 creates new process with name" do
    {:ok, pid} = CountingServer.start_link()
    assert Process.whereis(MyCounter) == pid
  end

  test "start_link/1 creates new linked process with name" do
    {:ok, pid} = CountingServer.start_link(false)
    assert self() != pid
    assert Process.alive?(pid)
    {:links, links} = Process.info(self(), :links)
    assert pid in links
    assert Process.whereis(MyCounter) == pid
  end

  test "ask for number returns a number" do
    {:ok, pid} = CountingServer.start_link(false)
    send(pid, {:current_number, self()})

    assert_receive 1
  end

  test "current_number/1 returns current number" do
    {:ok, _pid} = CountingServer.start_link(false)
    assert CountingServer.current_number(MyCounter) == 1
  end

  test "sending :double doubles the number" do
    {:ok, pid} = CountingServer.start_link(false)
    assert CountingServer.current_number(MyCounter) == 1
    send(pid, :double)
    assert CountingServer.current_number(MyCounter) == 2
  end

  @tag :not_impl
  test "start_link/1 with true starts counting" do
    {:ok, _pid} = CountingServer.start_link(true)
    first_number = CountingServer.current_number(MyCounter)
    Process.sleep(700)
    second_number = CountingServer.current_number(MyCounter)
    assert first_number < second_number
    Process.sleep(700)
    third_number = CountingServer.current_number(MyCounter)
    assert second_number < third_number
  end
end
