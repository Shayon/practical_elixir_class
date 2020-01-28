defmodule CountingServer do
  def start_link() do
    {:ok, spawn_link(fn -> nil end)}
  end
end
