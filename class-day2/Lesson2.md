---
theme : "white"
highlightTheme: "darkula"
---

# Lesson 2

---

## Basic types

```elixir
iex> 1          # integer
iex> 1.0        # float
iex> true       # boolean
iex> :atom      # atom / symbol
iex> "elixir"   # string / UTF-8 encoded binary
iex> [1, 2, 3]  # list
iex> {1, 2, 3}  # tuple
```

---

## Binaries

```elixir
iex> "hi" # Raw representation <<104, 105>>
"hi"
iex> <<104, 105>>
"hi"
iex> "hel" <> "lo"
"hello"
iex> "h" <> x = "hi!"
"hi!"
iex> x
"i!"
```

---

## Special Lists

##### Charlists
A list of integers that is printed as a sequence of characters delimited by single quotes because all the integers in it represent valid ASCII characters.
```elixir
iex> 'hello' # Raw representation [104, 101, 108, 108, 111]
'hello'
iex> [104, 101, 108, 108, 111]
'hello'
```

---

## Special Lists

##### Keyword lists
A list of two-element tuples where the first element of the tuple is an atom and the second element can be any value.

```elixir
iex> [foo: 1, bar: 2]
[foo: 1, bar: 2]
iex> [{:foo, 1}, {:bar, 2}]
[foo: 1, bar: 2]
iex> Keyword.get([a: 1], :a)
1
```

---

## Lists
Pattern match allows you to deconstruct the head and tail of the list.

```elixir
iex> [head | tail] = [1, 2, 3]
[1, 2, 3]
iex> head
1
iex> tail
[2, 3]
iex> [1] ++ [2]
[1, 2]
iex> [1] ++ x = [1, 2]
[1, 2]
iex> x
[2]
```

---

## Map

```elixir
iex> data = "data"
"data"
iex> %{data => "other data"}
%{"data" => "other data"}
iex> %{atom_key: "any data"}
%{atom_key: "any data"}
```

---

## Struct

Structs are maps with a `:__struct__` key.
```elixir
defmodule Foo do
    defstruct [{:bar, 1}, :baz] # or [bar: 1, baz: nil]
end


iex> %Foo{}
%Foo{bar: 1, baz: nil}
iex> Map.keys(%Foo{})
[:__struct__, :bar, :baz]
iex> Map.values(%Foo{})
[Foo, 1, nil]
```

---

## Process ID or PID

```elixir
iex> self()
#PID<0.105.0>
```

---

## Anonymous Functions and Higher order functions

```elixir
iex> my_fun = fn (x) -> x end
#Function<7.91303403/1 in :erl_eval.expr/5>
iex> my_fun.(1)
1
iex> my_other_fn = fn some_fn -> some_fn.(10) end
#Function<7.91303403/1 in :erl_eval.expr/5>
iex> my_other_fn.(my_fun)
10
```

---

## Lambdas and Higher order functions
Capture operator: `&`

```elixir
defmodule Foo do
  def bar() do
    "baz"
  end

  def run_some_fn(some_fn) do
    some_fn.()
  end
end

iex> Foo.run_some_fn(&Foo.bar/0)
"baz"
```

---

## Shorthand Anonymous Functions
In shorthand form, &N refers to the N-th parameter

```elixir
iex> concat_lists = &(&1 ++ &2)
&:erlang.++/2
iex> concat_lists.([1, 2], [3])
[1, 2, 3]
```

---

## Anonymous Functions
We can have multiple clauses of an anonymous function for pattern matching

```elixir
iex> result_handler = fn
...>   {:ok, result} -> "Success: #{result}"
...>   {_, error} -> "Error: #{error}"
...> end
#Function<7.91303403/1 in :erl_eval.expr/5>
iex> result_handler.({:ok, 1})
"Success: 1"
iex> result_handler.({:error, "This didn't work!"})
"Error: This didn't work!"
```

---

## Alias, Require, Import, & Use

* `alias`: Allows you to set up aliases for any given module name.
* `require`: In order to use macros, you need to opt-in by requiring the module they are defined in.
* `import`: Gives access to functions or macros from other modules without using the fully-qualified name.
* `use`: Allow that module to inject any code in the current module, such as importing itself or other modules, defining new functions, setting a module state, etc.

---

End

---
