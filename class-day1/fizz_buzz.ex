defmodule FizzBuzz1 do
  def call(n) do
    if n == 100 do
      IO.puts("Buzz - Victory!")
    else
      if rem(n, 3) == 0 and rem(n, 5) == 0 do
        IO.puts("FizzBuzz")
      else
        if rem(n, 3) == 0 do
          IO.puts("Fizz")
        else
          if rem(n, 5) == 0 do
            IO.puts("Buzz")
          else
            IO.puts(n)
          end
        end
      end

      call(n + 1)
    end
  end
end

defmodule FizzBuzz2 do
  def call(n) do
    cond do
      n == 100 ->
        IO.puts("Buzz - Victory!")

      rem(n, 3) == 0 and rem(n, 5) == 0 ->
        IO.puts("FizzBuzz")
        call(n + 1)

      rem(n, 3) == 0 ->
        IO.puts("Fizz")
        call(n + 1)

      rem(n, 5) == 0 ->
        IO.puts("Buzz")
        call(n + 1)

      true ->
        IO.puts(n)
        call(n + 1)
    end
  end
end

defmodule FizzBuzz3 do
  def call(n) do
    case n do
      100 ->
        IO.puts("Buzz - Victory!")

      n when rem(n, 3) == 0 and rem(n, 5) == 0 ->
        IO.puts("FizzBuzz")
        call(n + 1)

      n when rem(n, 3) == 0 ->
        IO.puts("Fizz")
        call(n + 1)

      n when rem(n, 5) == 0 ->
        IO.puts("Buzz")
        call(n + 1)

      _ ->
        IO.puts(n)
        call(n + 1)
    end
  end
end

defmodule FizzBuzz4 do
  def call(100) do
    IO.puts("Buzz - Victory!")
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

  def call(n) do
    IO.puts(n)
    call(n + 1)
  end
end

defmodule FizzBuzz do
  def call(100) do
    IO.puts("Buzz - Victory!")
  end

  def call(n) do
    call(rem(n, 3), rem(n, 5), n)
    call(n + 1)
  end

  def call(0, 0, _) do
    IO.puts("FizzBuzz")
  end

  def call(_, 0, _) do
    IO.puts("Buzz")
  end

  def call(0, _, _) do
    IO.puts("Fizz")
  end

  def call(_, _, n) do
    IO.puts(n)
  end
end

FizzBuzz.call(80)
