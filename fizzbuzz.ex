defmodule FizzBuzz do
  def call(n) do
    case n do
      100 ->
        IO.puts("Buzz")

      n when rem(n, 3) == 0 and rem(n, 5) == 0 ->
        IO.puts("FizzBuzz")
        call(n + 1)

      n when rem(n, 5) == 0 ->
        IO.puts("Buzz")
        call(n + 1)

      n when rem(n, 3) == 0 ->
        IO.puts("Fizz")
        call(n + 1)

      n ->
        IO.puts(n)
        call(n + 1)
    end
  end
end

defmodule FizzBuzz2 do
  def call(100) do
    IO.puts("Buzz")
  end

  def call(n) when rem(n, 3) == 0 and rem(n, 5) == 0 do
    IO.puts("FizzBuzz")
    call(n + 1)
  end

  def call(n) when rem(n, 5) == 0 do
    IO.puts("Buzz")
    call(n + 1)
  end

  def call(n) when rem(n, 3) == 0 do
    IO.puts("Fizz")
    call(n + 1)
  end

  def call(23) do
    IO.puts("woops")
    call(1)
  end
end

FizzBuzz2.call(80)
