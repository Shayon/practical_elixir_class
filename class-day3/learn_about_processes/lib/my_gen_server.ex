defmodule MyGenServer do
  def start_link(module, atom_list, keyword_list \\ []) do
    if(not is_atom(keyword_list[:name])) do
      raise ArgumentError, message: "expected :name to be an atom"
    end

    pid = spawn_link(__MODULE__, :init, [module, atom_list])
    Process.register(pid, keyword_list[:name])
    {:ok, pid}
  end

  def init(module, init_args) do
    {:ok, state} = module.init(init_args)

    listener(module, state)
  end

  def listener(module, state) do
    state =
      receive do
        {:call, msg, pid} ->
          {:reply, reply, new_state} = module.handle_call(msg, pid, state)
          send(pid, {:response, reply})
          new_state
      end

    listener(module, state)
  end

  def call(server, msg) do
    pid = Process.whereis(server)
    send(pid, {:call, msg, self()})

    receive do
      {:response, response} -> response
    end
  end

  def start(module, args) do
    pid = spawn(__MODULE__, :init, [module, args])
    {:ok, pid}
  end
end
