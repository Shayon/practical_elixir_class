defmodule CountingServer do
  def start_link(flag \\ false) do
    pid = spawn_link(CountingServer, :listener, [])
    Process.register(pid, MyCounter)
    if flag do
      send(pid, :increment)
    end

    {:ok, pid}
  end

  def listener(current_number \\ 1) do
    current_number =
      receive do
        {:current_number, pid} ->
          send(pid, current_number)
          current_number
        :increment ->
          Process.send_after(self(), :increment, 500)
          current_number + 1
        :double ->
          current_number * 2
      end

    listener(current_number)
  end

  def current_number(process_name) do
    pid = Process.whereis(process_name)
    send(pid, {:current_number, self()})

    receive do
      response -> response
    end
  end
end
