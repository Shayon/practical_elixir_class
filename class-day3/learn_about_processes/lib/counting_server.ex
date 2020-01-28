defmodule CountingServer do
  def start_link(flag \\ false) do
    pid = spawn_link(fn-> nil end)
    Process.register(pid, MyCounter)

    receive do
      {:current_number, pid} -> send(pid, 1)
    end

    {:ok, pid}
  end

end
