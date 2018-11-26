# CPSC-354
This is a blog for the class CPSC-354 Programming Languages. Team members include: Andrew Dieken, Matt McCortney, Alberto G. 

# Why we chose Haskell

# Project
#### Truth Table
Implement truth tables for formulas of propositional logic. We can use these to decide whether a formula is a tautology (true in all interpretations) or satisfiable (true in at least one interpretation). The output could just be this classification, or it could be the full truth table, showing the value of the formula under each interpretation.

- Download Haskell: https://www.haskell.org/platform/mac.html
- Documentation: file:///Library/Haskell/ghc-8.4.3-x86_64/doc/start.html
#### Dates:
- Concept Stage: 10/19
- Definition Stage: 10/29
- Development Stage: 11/28
- Testing Stage: 12/7

#### Examples:
- implement a calculator
- spam filter

# Exercises

**Exercise (Algorithms):** Choose a simple algorithm and formulate it as a rewriting system as in the exercise on sorting above. *Write a blog post about it.* Add in as much as you want and can of the material we learned so far.

- Answer.

  - diff(0,x) -> 0
  - diff(x,0) -> x
  - diff(s(y),s(x)) -> s(diff(y,x))


**Exercise:** Write a program in your programming language that contains a while loop or recursive calls and show termination by exhibiting a measure function. Write a blog post about it.

- Answer: The below function allows the user to calculate the fibonacci number of a given input(integer). The function shows termination on line 2. The function returns when the input equals 0. The function makes a recursive call on line 4 adding the previous 2 numbers together.

 1) fib :: Integer -> Integer --function declaration
 2) fib 0 = 0                 --function definition
 3) fib 1 = 1
 4) fib n = fib(n-1) + fib(n-2)
 
 

**Exercise:** Go back to your class on data structures and algorithms and find an algorithm based on a while-loop and analyse it from the point of view of invariants and partial correctness.

- Answer: Binary Search algorithm
