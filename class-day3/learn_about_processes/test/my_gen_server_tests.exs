defmodule MyGenServerTests do
  use ExUnit.Case

  defmodule Stack do
    def init(args) do
      {:ok, args}
    end

    def handle_call(:pop, _from, [h | t]) do
      {:reply, h, t}
    end

    def handle_call(:noreply, _from, h) do
      {:noreply, h}
    end

    def handle_cast({:push, element}, state) do
      IO.puts("cast")
      {:noreply, [element | state]}
    end
  end

  test "start_link/3 handles bad input" do
    assert_raise ArgumentError, ~r"expected :name to be an atom", fn ->
      MyGenServer.start_link(Stack, [:hello], name: "my_gen_server_name")
    end

    assert_raise ArgumentError, ~r"expected :name to be an atom", fn ->
      MyGenServer.start_link(Stack, [:hello], name: {:invalid_tuple, "my_gen_server_name"})
    end
  end

  test "start_link/3 handles valid input" do
    MyGenServer.start_link(Stack, [:hello], name: :stack)
    assert MyGenServer.call(:stack, :pop) == :hello
  end

  test "start/2" do
    {:ok, pid} = MyGenServer.start(Stack, [:hello])
    {:links, links} = Process.info(self(), :links)
    refute pid in links
  end

  test "start_link/2, call/2 and cast/2" do
    {:ok, pid} = MyGenServer.start_link(Stack, [:hello])

    {:links, links} = Process.info(self(), :links)
    assert pid in links

    assert MyGenServer.call(pid, :pop) == :hello
    assert MyGenServer.cast(pid, {:push, :world}) == :ok
    assert MyGenServer.call(pid, :pop) == :world
  end
end
