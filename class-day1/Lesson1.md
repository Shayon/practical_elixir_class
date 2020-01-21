---
theme : "white"
highlightTheme: "darkula"
---

# Practical Elixir:

### An introduction

<small>Instructor: Shayon Javadizadeh</small>

---

Before we can talk about Elixir, we need to know about Erlang

---

## Erlang

* Built at Ericsson for telephony switches
* Creators: Joe Armstring, Robert Virding, Mike Williams
* Runs on the BEAM (Bogdan Erlang Abstract Machine)

---

## Principles

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

Okay, so why are we talking about Erlang again?

---

## Elixir Runs on the BEAM

Elixir is compiled into byte code that is then executed on the BEAM

---

## Elixir

Created by José Valim at Plataformatec
* Enable higher extensibility and productivity in the Erlang VM
while keeping compatibility with Erlang's ecosystem

---

## OTP

* Provides standard modules and behaviors
* Also provides the BEAM
* Practices and style of thinking

---

## Concurrency and Parallelism

* One thread per core
* One scheduler per thread
* One run queue per scheduler

<small>by  default</small>

---

## Scheduler

Preemptive, _not_ Cooperative

---

<img  width="900" height="550" data-src="https://res.cloudinary.com/practicaldev/image/fetch/s--KudQWkby--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://cdn-images-1.medium.com/max/1600/1%2Ay-ntFQVJC8qMBi1XK1S15w.png" alt="BEAM Diagram">

<small>Source: [Sophie DeBenedetto](https://dev.to/sophiedebenedetto/elixir-and-the-beam-how-concurrency-really-works-354n)</small>

---

Okay, can we get our hands dirty?

---

## Pattern Matching
Checking a given sequence of tokens for the presence of the constituents of some pattern.

---

To the code!

---
