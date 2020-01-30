defmodule CountingServer do
  def start_link(start_counting \\ true) do
    pid = spawn_link(__MODULE__, :init, [start_counting])
    Process.register(pid, MyCounter)
    {:ok, pid}
  end

  def init(start_counting) do
    state = %{count: 1}

    if start_counting do
      send(self(), :count_up)
    end

    loop(state)
  end

  def current_number(name) do
    pid = Process.whereis(name)
    send(pid, {:current_number, self()})

    receive do
      number -> number
    end
  end

  defp handle_count_up(%{count: count} = state) do
    # IO.puts("Counting... #{count}")
    Process.send_after(self(), :count_up, 500)
    {:noreply, %{state | count: count + 1}}
  end

  defp handle_current_number(%{count: count} = state) do
    {:reply, count, state}
  end

  defp handle_double(%{count: count} = state) do
    {:noreply, %{state | count: count * 2}}
  end

  defp loop(state) do
    receive do
      :count_up ->
        {:noreply, new_state} = handle_count_up(state)
        loop(new_state)

      {:current_number, calling_pid} ->
        {:reply, count, new_state} = handle_current_number(state)
        send(calling_pid, count)
        loop(new_state)

      :double ->
        {:noreply, new_state} = handle_double(state)
        loop(new_state)
    end
  end
end
