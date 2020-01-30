defmodule MyGenServer do
  def start_link(module, init_args, opts \\ []) do
    if !is_atom(non_atom = Keyword.get(opts, :name, :atom)) do
      raise ArgumentError, message: "Got #{inspect(non_atom)} expected :name to be an atom"
    end

    pid = spawn_link(__MODULE__, :init, [module, init_args])

    case Keyword.fetch(opts, :name) do
      {:ok, name} -> Process.register(pid, name)
      :error -> nil
    end

    {:ok, pid}
  end

  def start(module, init_args, opts \\ []) do
    if !is_atom(non_atom = Keyword.get(opts, :name, :atom)) do
      raise ArgumentError, message: "Got #{inspect(non_atom)} expected :name to be an atom"
    end

    {:ok, spawn(__MODULE__, :init, [module, init_args])}
  end

  def init(module, init_args) do
    {:ok, state} = module.init(init_args)
    loop(module, state)
  end

  def loop(module, state) do
    receive do
      {:cast, msg} ->
        {:noreply, new_state} = module.handle_cast(msg, state)
        loop(module, new_state)

      {:call, calling_pid, msg} ->
        {:reply, count, new_state} = module.handle_call(msg, calling_pid, state)
        send(calling_pid, {:reply, count})
        loop(module, new_state)
    end
  end

  def call(server, request) do
    pid =
      case server do
        server when is_pid(server) -> server
        server -> Process.whereis(server)
      end

    send(pid, {:call, self(), request})

    receive do
      {:reply, count} -> count
    end
  end

  def cast(server, request) do
    pid =
      case server do
        server when is_pid(server) -> server
        server -> Process.whereis(server)
      end

    send(pid, {:cast, request})
    :ok
  end
end
