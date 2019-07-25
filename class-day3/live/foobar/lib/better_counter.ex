defmodule BetterCounter do
  use GenServer

  def start_link(opts) do
    name = Keyword.get(opts, :name, __MODULE__)
    GenServer.start_link(__MODULE__, {0, name}, name: name)
  end

  def init({starting_number, name}) do
    send(self(), :count_up)
    {:ok, %{count: starting_number, name: name}}
  end

  def handle_info(:count_up, %{count: 10, name: name}) do
    IO.puts("#{name}: Counting... 10")
    raise "Oh jeez"
  end

  def handle_info(:count_up, %{count: count, name: name} = state) do
    IO.puts("#{name}: Counting... #{count}")
    send(self(), :count_up)
    Process.sleep(1_000)

    {:noreply, %{state | count: count + 1}}
  end

  def handle_call(:current_number, _from, %{count: count} = state) do
    {:reply, count, state}
  end

  def handle_cast(:double, _from, %{count: count} = state) do
    {:noreply, %{state | count: count * 2}}
  end
end
