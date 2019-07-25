defmodule Foobar do
  use Application

  def start(_type, _args) do
    children = [
      {BetterCounter, [name: MyCounter]}
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
