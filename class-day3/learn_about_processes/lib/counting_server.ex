defmodule CountingServer do
  def start_link(flag \\ false) do
    pid = spawn_link(CountingServer, :listener, [])
    Process.register(pid, MyCounter)

    {:ok, pid}
  end

  def listener() do
    receive do
      {:current_number, pid} -> send(pid, 1)
    end
  end

  def current_number(process_name) do
  end
end
