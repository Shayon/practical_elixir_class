defmodule WordCounter do
  @a_lot_of_words "lib/word_files/a_lot_of_words.txt"
  @r_frost "lib/word_files/rfrost.txt"

  # def benchmark_find() do
  #   Benchee.run(
  #     %{
  #       "eager" => fn -> find_hamburger_eagerly(@a_lot_of_words) end,
  #       "lazy" => fn -> find_hamburger_lazily(@a_lot_of_words) end
  #     },
  #     time: 10,
  #     memory_time: 2
  #   )
  # end

  # def benchmark_count() do
  #   Benchee.run(
  #     %{
  #       "eager" => fn -> count_words_eagerly(@a_lot_of_words) end,
  #       "lazy" => fn -> count_words_lazily(@a_lot_of_words) end,
  #       "flow" => fn -> count_words_with_flow(@a_lot_of_words) end
  #     },
  #     time: 10,
  #     memory_time: 2
  #   )
  # end
end
