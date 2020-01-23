defmodule ListOps do
  @moduledoc """
  Implements list operations from scratch.  Will not use any external modules OR Kernel.++/2.
  """

  def reduce([], acc, reducer) do
    acc
  end

  def reduce([head | tail], acc, reducer) do
    reduce(tail, reducer.(head, acc), reducer)
  end

  def count() do
  end
end
