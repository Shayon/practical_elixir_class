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

  def count(list) do
    reduce(list, 0, fn _, acc -> acc + 1 end)
  end

  def reverse(list) do
    reduce(list, [], &[&1 | &2])
  end

  def map(list, mapper) do
    reverse(reduce(list, [], fn item, acc -> [mapper.(item) | acc] end))
  end
end
