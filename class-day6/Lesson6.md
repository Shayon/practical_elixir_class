---
theme : "white"
highlightTheme: "darkula"
---

# Lesson 6


---

## Debugging an Elixir App

* What are we dealing with? What is the process topology?

* What are the messages being passed to between processes?

* What are the functions being invoked?

---

## Observer

* A powerful tool that can manage/trace/observe a running application.

* Can be launched from a remote node.

* Can be launched with "`:observer.start()`"

---

## Process Topology Functions

* Node.list()  (if you are on multiple nodes)
* Process.registered()
* Supervisor.which_children(SupervisorName)
* Process.whereis(:local_process_name)

---

## Process Lifecycle Functions

* `Process.alive?(pid)`
* `Process.monitor(pid) - Will send message to the calling process when pid dies: `{:DOWN, ref, :process, object, reason}`

---

##  Process Information

* `Process.info(pid, :memory)`
* `Process.info(pid, :message_queue_len)`
* `Process.info(pid, :messages)`
* `Process.info(pid, :reductions)`
* `:sys.get_state(pid)`

---

##  Live Tracing with `:dbg`

```elixir
#Define a process handler and start tracer
:dbg.tracer(:process, {fn msg, state ->
  fn_body end, initial_state})
# :r for received or :s for sent messages
:dbg.p(pid, [:r])
# trace function calls
:dbg.p(pid, [:call])
# specify "trace patterns" for calls you're interested in.
# In this case any fn in My.Module
:dbg.tp(My.Module, :_, [])
# Stop tracing
:dbg.stop_clear
```

---

End

---

