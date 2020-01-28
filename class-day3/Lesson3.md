---
theme : "white"
highlightTheme: "darkula"
---

# Lesson 3


---

## Parallelism and Concurrency

Parallelism is about executing many things at once.

Concurrency is about being able to deal with many things at once. Which requires coordination - which introduces complexity


---

## Threads

Independently executing subsets of a process.
* Coordinate by sharing memory
* Communicate by mutating shared data
* Don't want to overwrite this data by accident, so need to use concurrency control via locks
* Tough to manage - lots of mutable state, deadlocks

---

## The Actor Model

* Invented by Carl Hewitt in 1973
* Isolated actors communicate by sending messages
* Never directly share data

---

## Back to the principles

* Everything is a process
* Processes are strongly isolated
* Process creation and destruction is a lightweight operation.
* Message passing is the only way for processes to interact.
* Processes have unique names.
* If you know the name of a process you can send it a message.
* Processes share no resources.
* Error handling is non-local.
* Processes do what they are supposed to do or fail.

---

## Critical information

* Not OS processes
* lightweight
* no shared memory
* unique id

---

## Creating Processes

spawn & spawn_link

`spawn(module, fun, args)`
Spawns the given function fun from the given module passing it the given args and returns its PID.

When two processes are linked, each one receives exit signals from the other

---

## Who am I

`self()` returns pid for the current process.

---

## Sending Messages

`send(pid, msg)` sends msg to pid

`Process.send_after(pid, msg, delay_ms)` sends msg to pid after delay_ms


recieve proc regi

---

## Receiving Messages

```elixir
receive do
  some_msg -> #do something
end
```

---

## Naming and finding named processes

`Process.register(pid, name)` Registers pid under name.

`Process.whereis(name)` Returns pid for process registered under name.

---

End

---
