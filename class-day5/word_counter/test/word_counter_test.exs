defmodule WordCounterTest do
  use ExUnit.Case

  @a_lot_of_words "lib/word_files/a_lot_of_words.txt"
  @r_frost "lib/word_files/rfrost.txt"

  @rfrost_count %{
    "village" => 1,
    "a" => 2,
    "stopping" => 1,
    "near" => 1,
    "see" => 1,
    "sleep" => 2,
    "know" => 1,
    "evening" => 1,
    "stop" => 1,
    "harness" => 1,
    "year" => 1,
    "dark" => 1,
    "sounds" => 1,
    "wind" => 1,
    "are" => 2,
    "only" => 1,
    "before" => 2
  }

  @a_lot_of_words_count %{
    "annihilated" => 20,
    "EMBOLISMAfter" => 10,
    "sedateness" => 10,
    "Hygroma" => 30,
    "citizens" => 1090,
    "aides" => 10,
    "builders" => 80,
    "roots" => 120,
    "dissect" => 30,
    "INFIRMARY" => 20,
    "Bubo" => 10,
    "Infraclavicular" => 10,
    "ordain" => 20,
    "VesselsIn" => 10,
    "destroys" => 50,
    "urica" => 10,
    "attempting" => 180,
    "daintiest" => 10,
    "reminder" => 60,
    "supervision" => 200,
    "consecrated" => 10,
    "ledge" => 50,
    "bandy" => 40,
    "trailer" => 30,
    "handleless" => 10,
    "onelet" => 10,
    "18171825" => 10,
    "defiantly" => 10,
    "injunction" => 110,
    "5300" => 10,
    "pituitary" => 30,
    "warlike" => 100
  }

  test "find_hamburger_eagerly/1" do
    assert WordCounter.find_hamburger_eagerly(@r_frost) == false
    assert WordCounter.find_hamburger_eagerly(@a_lot_of_words) == true
  end

  @tag :not_impl
  test "find_hamburger_lazily/1" do
    assert WordCounter.find_hamburger_lazily(@r_frost) == false
    assert WordCounter.find_hamburger_lazily(@a_lot_of_words) == true
  end

  @tag :not_impl
  test "count_words_eagerly/1" do
    assert @rfrost_count = WordCounter.count_words_eagerly(@r_frost)

    assert @a_lot_of_words_count = WordCounter.count_words_eagerly(@a_lot_of_words)
  end

  @tag :not_impl
  test "count_words_lazily/1" do
    assert @rfrost_count = WordCounter.count_words_lazily(@r_frost)

    assert @a_lot_of_words_count = WordCounter.count_words_lazily(@a_lot_of_words)
  end

  @tag :not_impl
  test "count_words_with_flow/1" do
    assert @rfrost_count = WordCounter.count_words_with_flow(@r_frost)

    assert @a_lot_of_words_count = WordCounter.count_words_with_flow(@a_lot_of_words)
  end
end
