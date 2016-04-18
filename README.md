# Why You Should Take a Hard Look at Functional Programming

## An Akron Code Club Presentation

These are the live coding demonstrations that show off some of the power and elegance of functional programming.

### Functions as First Class Objects

When functions exist as first class objects in a language, they can be passed into functions as arguments.

The [first_class.erl](first_class.erl) module shows how we evolved a *simple* recursive mechanism to square all values in a list of integers. The eventual solution was extracting the *squaring* logic into its own function and passing that function into the list traversing logic.

This is a manual demonstration of Erlang's `lists:map/2` function, which applies any arity-1 function to each element of a list, returning the list of results.

### Closures

First class functions also means that functions can generate functions.

This small example, [closures.erl](closures.erl), shows how to encapsulate data into an anonymous function which can be applied to different data later. The solution involves a paramterized function generator; the generated function is passed as an argument to the second function.

### Tail Call Optimization

Erlang, and many other functional languages, can optimize stack growth when functions use tail calls. A tail call is when the last thing a function does is to delegate to another function (sometimes the same function, recursively). In this case, the stack frame of the original function can be replaced by the new function. This allows lengthy recursion to retain the performance characteristics of tight interative loops.

The example [tail_call.erl](tail_call.erl) shows a naive version and a tail-call optimized version of the fibonacci sequence. The unit tests show the performance characteristics of the tail-call optimized version.
