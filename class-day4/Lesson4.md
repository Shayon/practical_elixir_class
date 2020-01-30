---
theme : "white"
highlightTheme: "darkula"
---

# Lesson 4


---

## "Let it crash"

Building code that does not concern itself with detailed error handling

---

## Supervisors

A supervisor is a process which supervises other processes, which we refer to as child processes. Supervisors are used to build a hierarchical process structure called a supervision tree. Supervision trees provide fault-tolerance and encapsulate how our applications start and shutdown.

---

## Child Specifications

The child specification describes how the supervisor starts, shuts down, and restarts child processes.

---

## Child Restart Strategies

* `:permanent` - the child process is always restarted.

* `:temporary` - the child process is never restarted, regardless of the supervision strategy: any termination (even abnormal) is considered successful.

* `:transient` - the child process is restarted only if it terminates abnormally, i.e., with an exit reason other than :normal, :shutdown

---

##  Supervision Strategies

* `:one_for_one` - if a child process terminates, only that process is restarted.
* `:one_for_all` - if a child process terminates, all other child processes are terminated and then all child processes (including the terminated one) are restarted.
* `:rest_for_one` - if a child process terminates, the terminated child process and the rest of the children started after it, are terminated and restarted.

---

End

---

