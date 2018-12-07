# Exercises

**Exercise (Algorithms):** Choose a simple algorithm and formulate it as a rewriting system as in the exercise on sorting above. *Write a blog post about it.* Add in as much as you want and can of the material we learned so far.

- Answer.

  - diff(0,x) -> 0
  - diff(x,0) -> x
  - diff(s(y),s(x)) -> s(diff(y,x))


**Exercise:** Write a program in your programming language that contains a while loop or recursive calls and show termination by exhibiting a measure function. Write a blog post about it.

- Answer: The below function allows the user to calculate the fibonacci number of a given input(integer). The function shows termination on line 2. The function returns when the input equals 0. The function makes a recursive call on line 4 adding the previous 2 numbers together.

```haskell
fib :: Integer -> Integer --function declaration
fib 0 = 0                 --function definition
fib 1 = 1
fib n = fib(n-1) + fib(n-2)
``` 
 

**Exercise:** Go back to your class on data structures and algorithms and find an algorithm based on a while-loop and analyse it from the point of view of invariants and partial correctness.

- Answer: Binary Search algorithm
measure funtion = length of input array. measure funton you want to get less and less and with each recursive call you're cuttibng the input aray in half.

```python
def binarySearch(arr, element):
  first = 0
  last = len(arr)-1
  found = False
  while first <= last and not found:
    mid = (first+last) / 2
    if arr[mid] == element:
      found = True
    else:
      if element < arr[mid]:
        last = mid - 1
      else:
        first = mid + 1
        return found
```

**Exercise:** ARS (basic definitions)

In the context of abstract reduction systems, define the notions of 
- normal form, 
- equivalence, 
- unique normal form, 
- confluence, 
- termination. 

**Exercise** String Rewriting

Which of the following statements are true?

- A terminating and confluent ARS has unique normal forms.
- Lambda calculus is confluent.
- Lambda calculus is terminating.
- Simply typed lambda calculus is confluent.
- Simply typed lambda calculus is terminating.
- Lambda calculus is an ARS.
- Lambda calculus is not a TRS because of the $\alpha$-rule.
- Lambda calculus can easily be extended by high-level programming constructs.
- Untyped lambda calculus is a Turing complete programming language.
- Simply typed lambda calculus is a Turing complete programming language.
- The halting problem for the simply typed lambda calculus is decidable.
- Typchecking in the simply typed lambda calculus is decidable.
- Type inference in the simply typed lambda calculus is decidable.
- ... probably add some more ...

**Exercise**Define the notion of a lexicographic product.


**Exercise** String rewriting

Consider the schemas of rules

        ba -> ab
        ab -> ba
        ac -> ca
        ca -> ac
        bc -> cb
        cb -> bc
        
        ab ->
        aa ->
        bb ->
        
        cc -> c

        
- Write down an English sentence describing the meaning of the first 6 rules schemas. Express this as as invariant.

- Compute the normal form of `ababaaa`.

- Does `abcabacaac` reduce to normal form?
  
- Can you find a nice way of stating which words are in the equivalence class of `c`? Justify your answer.
  
- What is the unique normal form of the equivalence class containing `c`? Justify your answer.

- Does the equivalence class of `ac` has a unique normal form? Justify your answer.

- Is the ARS confluent? Justify your answer.

- List some invariants of the rules.
  
- Describe all equivalence classes using invariants.
  
- Show that one cannot reduce `ababababababac` to `c` using your invariants.
  
- Explain why the ARS does not terminate.
   
- Can you add rules so that equivalence classes remain the same, but the ARS becomes confluent? What are the unique normal forms of the equivlance classes?

- Change the rules so that the ARS becomes terminating without changing its equivalence classes. Justify your answer.

- Which measure function proves termination of your modified system? Justify your answer.

**Exercise** Hoare logic

Write down the rule of Hoare logic for while loops.


**Exercise** Partial Correctness

In the following `a` is an array of integers.

        while ( j< N) {  
            s := s + a[j]
            j := j + 1  
        }
        
- Describe in your own words the effect of the loop.

- Find pre- and-post conditions for the while loop.

- Find an invariant of the loop. Justify your answer.

- Show that the pre-conditions imply the post-conditions.

**Exercise** Total Correctness (termination)

In the following `a` is an array of integers.

        while ( j< N) {  
            s := s + a[j]
            j := j + 1  
        }
        
Define a measure function and prove termination.

**Exercise** Lambda Calculus (basic definitions)

- Put the brackets `(` and `)` into the following lambda expressions to indicate the correct parsing.
  - $\lambda x.\lambda y. y\,x$
  - $(\lambda x.\lambda y. x)(\lambda f. \lambda x. f x)\lambda x.x$

- Explain the $\beta$-rule of the lambda-calculus. 

- Write down the computation rule for the fixpoint combinator.

- Write down the Church encodings of true, false, 0, 1, 2.

- Translate `if true then 1 else 0` into the untyped lambda calculus using Church encodings and reduce it to normal form.

**Exercise** Lambda Calculus (computations)

Reduce the following to normal form:

- $(\lambda x.\lambda y. x)\,(\lambda f. \lambda x. f x)\,\lambda x.x$ 
- $(\lambda f. f( f x))\,\lambda f. \lambda x. f x$
- $(\lambda f. \lambda x. f x)\,\lambda f. f( f x))$

**Exercise** Lambda Calculus (type inference)

Establish whether the following terms are typable in the simply typed lambda calculus and, if they are, compute their most general type.

- $\lambda x.\lambda y. y$
- $\lambda x.\lambda y. y(xx)$
- $(\lambda x.\lambda y. xyz)(\lambda a.\lambda b. b)$


