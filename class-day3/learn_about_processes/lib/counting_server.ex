defmodule CountingServer do
  def start_link(flag \\ false) do
    pid = spawn_link(fn-> nil end)
    Process.register(pid, MyCounter)
    {:ok, pid}
  end
end
