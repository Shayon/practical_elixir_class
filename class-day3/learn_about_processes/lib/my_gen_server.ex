defmodule MyGenServer do
  def start_link(module, atom_list, keyword_list) do
    if(not is_atom(keyword_list[:name])) do
      raise ArgumentError, message: "expected :name to be an atom"
    end
  end

  def init(module, init_args) do
    {:ok, state} = module.init(init_args)

    listener(module, state)
  end

  def listener(module, state) do
    state = receive do
      {:call, msg, pid} ->
        {:reply, reply, new_state} = module.handle_call(msg, state)
        new_state
    end

    listener(module, state)
  end

  def call(server, msg) do
    pid = Process.whereis(server)
    send(pid, {:call, msg, self()})

    receive do
      {:call, response} -> response
    end
  end
end
