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

  def filter(list, filter_func) do
    reverse(
      reduce(list, [], fn item, acc -> if filter_func.(item), do: [item | acc], else: acc end)
    )
  end

  def odd?(int) do
    rem(int, 2) == 1
  end

  def append(list1, list2) do
    reduce(reverse(list1), list2, fn item, acc -> [item | acc] end)
  end

  def concat(list_of_lists) do
    reduce(reverse(list_of_lists), [], fn list, acc -> append(list, acc) end)
  end
end
