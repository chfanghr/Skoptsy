# Skoptsy

An embedded interpreted synchronous DSL in `swift`.

This DSL follows the  imperative synchronous programming language [`Blech`](https://blech-lang.org/) and 
tries to recreate parts of it as an embedded interpreted DSL using the Swift `@resultBuilder`.

The imperative synchronous approach allows preemption and concurrency in a structured and modular way. 

(Actually I just want to have fun with swift's `@resultBuilder` and figure out how to build DSL in swift :smile)

*Note that* this implementation is just a proof of concept, 
    thus it has shortcomings like:

- No causality checking
- It's interpreted, not compiled.
- Variables are not type-safe(just like in python).
- ~~Test coverage is poor~~ (83% for now)
