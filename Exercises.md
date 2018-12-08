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

# Definitions
- Normal form: a is a normal form, or a is in normal form, if a is not reducible.
- Unique normal form: If a has exactly one normal form. A has unique normal forms if no element of A reduces to different normal forms
- Equivalence: 
- Confluence/confluent: if whenever x reduces to y and z, then y and z are joinable.
- Termination/terminating: if there is no infinite chain a0→a1→….
- Joinable: a,b  are joinable, written as a↓b, if both a and b reduce to the same element
- Curch-Rosser: if all equivalent elements are joinable
- Normalising: if every element has a normal form

**Exercise:** ARS (basic definitions)

In the context of abstract reduction systems, define the notions of 
- normal form: a is in normal form if a is not reducible. a term to which no rule applies is called a normal form
- equivalence: An equivalence relation is a relation that is reflexive, transitive and symmetric
- unique normal form: if a has exactly one normal form
- confluence: act or process of merging. which terms in such a system can be rewritten in more than one way, to yield the same result
- termination: if an ARS has a measure function, then it is terminating

**Exercise** String Rewriting

Which of the following statements are true?

- A terminating and confluent ARS has unique normal forms. -> True
- Lambda calculus is confluent. -> True
- Lambda calculus is terminating. -> True
- Simply typed lambda calculus is confluent. -> True
- Simply typed lambda calculus is terminating. -> True
- Lambda calculus is an ARS. -> True
- Lambda calculus is not a TRS because of the $\alpha$-rule. -> True
- Lambda calculus can easily be extended by high-level programming constructs. -> True
- Untyped lambda calculus is a Turing complete programming language. -> True
- Simply typed lambda calculus is a Turing complete programming language. -> True
- The halting problem for the simply typed lambda calculus is decidable. -> True
- Typchecking in the simply typed lambda calculus is decidable. -> True
- Type inference in the simply typed lambda calculus is decidable. -> True

**Exercise**Define the notion of a lexicographic product.

P1 Xlex P2
The product is given through the sets P1 & P2 and the pairs (p1,p2), (p1',p2')
So (p1,p2) > (p1',p2') then p1 > p2 OR p1 = p1' && p2>p2'

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

The first 6 rules schemas describe how you are able to rewrite certain pairs. If you find one of the 6 pairs you are able to rewrite the pair as the out put corresponding to that pair.

- Compute the normal form of `ababaaa`.

`ababaaa` -> `abaaa` -> `aaa` -> `a` 

- Does `abcabacaac` reduce to normal form?

`abcabacaac` -> `cabacaac` -> `cacaac` -> `ccaaac` -> `caaac` -> `cac` -> `cca` -> `ca`

NO, you are not able to reduce it to normal form
  
- Can you find a nice way of stating which words are in the equivalence class of `c`? Justify your answer.

the equivalence class of c will contain at least one c and where the total number of a's and b's is even

Justification is the ARS above.
  
- What is the unique normal form of the equivalence class containing `c`? Justify your answer.

The normal form of the equivalence class is c. This is because c is a normal form becuase c is not reducible.

- Does the equivalence class of `ac` has a unique normal form? Justify your answer.

No, because if you add `ab` to `ac` it becomes `aabc` which can reduce to both `ac` and `bc`

- Is the ARS confluent? Justify your answer.

No, because aabc can reduce to either ac or bc and these two cannot be rejoined.

- List some invariants of the rules.

  - the total number of a's and b's is even
  - the total number of a's and b's is odd
  - there are 0 c's
  - the number of c's is equal to or greater than 1
  
- Describe all equivalence classes using invariants.

4 classes 
  - even/no c
  - even/some c
  - odd/no c
  - odd/some c
  
- Show that one cannot reduce `ababababababac` to `c` using your invariants.

In `ababababababac` there are an odd number of a's and an odd number of b's but the class `c` needs to have an even number. Which means `ababababababac` cannot reduce to `c`
  
- Explain why the ARS does not terminate.

It does not terminate because the ARS allows reductions to cycle
   
- Can you add rules so that equivalence classes remain the same, but the ARS becomes confluent? What are the unique normal forms of the equivlance classes?

Add the rule b->a or a->b

- Change the rules so that the ARS becomes terminating without changing its equivalence classes. Justify your answer.

b->a
ca->ac
cc->c
aa->

this will allow you to always be left with `c` which does not change the equivalence classses.

- Which measure function proves termination of your modified system? Justify your answer.

Need to show that all four rules will reduce the measure function. 

**Exercise** Hoare logic

Write down the rule of Hoare logic for while loops.

{I^B}S{I} / {I}while B do S done {-B^I}


**Exercise** Partial Correctness

In the following `a` is an array of integers.

        while ( j< N) {  
            s := s + a[j]
            j := j + 1  
        }
        
- Describe in your own words the effect of the loop.

the loop sums up the integers in the array

- Find pre- and-post conditions for the while loop.

Pre:
s = 0
j = 0
N >= 0

Post:
Sum all all elements in `a`

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
For simplicities sack we are going to have L stand for the lambda notation

  - Lx.(Ly.(yx))
  - (Lx.(Ly.x))(Lf.(Lx.(fx)))(Lx.x)

- Explain the beta-rule of the lambda-calculus. 

beta-rule reduces all occurrances of x and replaces it with the variable outside of the brakets
`(` `)`. this is called capture avoiding substitution.

- Write down the computation rule for the fixpoint combinator.

fixF reduces to F fixF

- Write down the Church encodings of true, false, 0, 1, 2.

true is Lxy.x
false is Lxy.y
0 is Lxy.y
1 is Lxy.xy
2 is Lxy.x(xy)

- Translate `if true then 1 else 0` into the untyped lambda calculus using Church encodings and reduce it to normal form.

(Lxy.x)(Lxy.xy)(Lxy.y)
We reduce this by:
  - (Ly.(Lxy.xy))(Lxy.y) -> Lxy.xy

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


