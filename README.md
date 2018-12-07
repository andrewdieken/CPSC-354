# CPSC-354
This is a blog for the class CPSC-354 Programming Languages. Team members include: Andrew Dieken, Matt McCortney, Alberto Garibay. 

# Why we chose Haskell

Hello everyone, we are excited to begin our Programming Languages class at Chapman University this Fall (2018), and we look forward to learning much about a new language. For our project, we've decided to choose Haskell for some purely-functional programming, which we've always wanted to learn but haven't ever had much of an excuse to since it isn't object-oriented. We expect learning the language will be challenging since Haskell fits under a different programming paradigm than all of the other languages we've learned up to this point.

As for the project itself, we haven't yet decided what to do with Haskell. we've read that it's very useful in some situations, such as anti-spam and cryptocurrency verification purposes, but that it has also been criticized for its lazy-evaluation model. Nevertheless, we are optimistic about our work with Haskell and expect it to be a very different programming experience than any that we've learned so far.

# Presentations

### Andrew
#### Topic: [Loops](https://github.com/andrewdieken/CPSC-354/blob/master/Loops.md)

### Matt
#### Topic: [History of Haskell](https://github.com/andrewdieken/CPSC-354/blob/master/IntrotoHaskell.md) and [Types of Classes](https://github.com/andrewdieken/CPSC-354/blob/master/TypesandClasses.md)

### Alberto
#### Topic: [Functional Programming](https://github.com/andrewdieken/CPSC-354/blob/master/DefiningFunctions.md)

# Project
#### Truth Table
Implement truth tables for formulas of propositional logic. We can use these to decide whether a formula is a tautology (true in all interpretations) or satisfiable (true in at least one interpretation). The output could just be this classification, or it could be the full truth table, showing the value of the formula under each interpretation.

- Download Haskell: https://www.haskell.org/platform/mac.html
- Documentation: file:///Library/Haskell/ghc-8.4.3-x86_64/doc/start.html

First things first, we want to define what propositions are. Every proposition will either take a value of True or False. These values are called the truth values. It is also important to note that all propositions will ahve a truth value.

Here is an example that will hopefully clear up any confusion - 
Ex) Consider the following proposition: October 21, 2012 was Sunday and Sunday is a holiday.

- The given compound proposition is made up of two simple propositins,
  - p = October 21, 2012 was Sunday
  - q = Sunday is a holiday
- If we check the 2012 calendar we can see that October 21st was on a Sunday. So, the truth value of proposition p is True.
- Sunday is also a holiday, so the truth value of proposition q is True.
- So, p = True and q = True

Now that we have defined propositions, we can move into defining truth tables. A truth table is a complete list of possible truth values of a given proposition. Truth tables are made up of
  - proposition values (True, False)
  - variables (A, B, ..., Z)
  - negation (-)
  - conjunction (^)
  - implication (=>)
  
The above operators can also be defined using truth tables. Which is what we want!

|A|-A|  
|-|--|  
|F|T |  
|T|F | 
 
|A|B|(A^B)=>A|
|-|-|:------:|
|F|F|T       |
|F|T|T       |
|T|F|T       |        
|T|T|T       |

|A|B|A=>B|
|-|-|:--:|
|F|F|T   |
|F|T|T   |
|T|F|F   |
|T|T|T   |
  
With the following defined, we can conclude that the following are all true:
  - A ^ - A
  - (A ^ B) => A
  - A => (A ^ B)
  - (A ^ (A => B)) => B
  
For our 4 proposition examples defined above, the resulting truth tables are as follows:

|A|A ^ - A|
|-|:-----:|
|F|F      |
|T|F      |

|A|B|(A ^ B) => A|
|-|-|:----------:|
|F|F|T           |
|F|T|T           |
|T|F|T           |
|T|T|T           |

|A|B|A => (A ^ B)|
|-|-|:----------:|
|F|F|T           |
|F|T|T           |
|T|F|F           |
|T|T|T           |

|A|B|(A ^ (A => B)) => B|
|-|-|:-----------------:|
|F|F|T                  |
|F|T|T                  |
|T|F|T                  |
|T|T|T                  |
  
Finally we can get into some Haskell! The 4 propositions defined above can be defined in Haskell as follows (which we are going to use as our input for our final function!):

```haskell
p1 :: Prop 
p1 = And (Var 'A') (Not (Var 'A'))
```

```haskell
p2 :: Prop 
p2 = Imply (And (Var 'A') (Var 'B')) (Var 'A')
```

```haskell
p3 :: Prop 
p3 = Imply (Var 'A') (And (Var 'A') (Var 'B'))
```

```haskell
p4 :: Prop 
p4 = Imply (And (Var 'A') (Imply (Var 'A') (Var 'B'))) (Var 'B')
```

Next, in order to evaluate a proposition into a logical value we need to know the value of each of its variables. This will be done by declaring a substitution as a lookup table. This look up table will:
  - associate variable names to logical values
  - use the Assoc type 
```haskell
type Subset = Assoc Char Bool
```

Next, we need a function that will evaluate a proposition given a substitution for its variable. This can be done using pattern matching on 5 possible forms that the propositions could have. We declare and define our function below:
```haskell
eval :: Subset -> Prop -> Bool
eval _ (Const b) = b
eval s (Var x) = find x s
eval s (Not p) = not (eval s p)
eval s (And p q) = eval s p && eval s q
eval s (Imply p q) = eval s p <= eval s q
```
Something to note that our group found interesting is that the the operator => defind above is implemented using the <= on logical values.

Next, we need to consider all possible substitutions for the variables that the truth table contains. So, obviously we need to define a function that will return a list of all variables in a proposition.
```haskell
vars :: Prop -> [Char]
vars (Const _) = []
vars (Var x) = [x]
vars (Not p) = vars p
vars (And p q) = vars p ++ vars q
vars (Imply p q) = vars p ++ vars q
```
Now that we have ways to:
  - fine the value of each variable
  - evaluate our proposition given a substitution for its variables
  - return a list of all variables in our propostion

we can move onto our next step which is to define a function that will give us a list of logical values of a given length. We can declare the function:

```haskell
bools :: Int -> [[Bool]]
```

For example if we want all 8 lists given 3 logical values we would call:

```haskell 
bools 3
```

And our output would be:

[[False, False, False],
 [False, False, True],
 [False, True, False],
 [False, True, True],
 [True, False, False],
 [True, False, True],
 [True, True, False],
 [True, True, True]]


So, now that we have declared the function and defined what our output should be we can define our function!! Our first thought when defining our function was to think of our inputs, True and False, as binary digits. When thinking of our inputs this way we can then think of our function as just counting in binary over the appropriate range of numbers. In other words, our function would convert a non-negative integer into a binary number represented as a list of bits (Cool!).

However, after thinking about our function this way we thought of a better way. To use recursion! For our base case where we are given 0 logical values we would return all lists of zero logical values. Then in our recursive call, taking an input of 'n' logical values, we just take 2 copies of the lists which are produced by our function bools (n-1), we just have to place False in front of each list (in the first copy) and True in front of each list (in the second copy) and obviously append the results.

So now we can think of our output as:

False|False False

False|False True 

False|True False 

False|True True  

True |False False

True |False True 

True |True False 

True |True True  

We define our funtion 'bools' as follows:
```haskell
bools :: Int -> [[Bool]]
bools 0 = [[]]
bools n = map (False:) bss ++ map (True:) bss where bss = bools (n-1)
```

Again, our function above is going to generate all possible lists of logical values for the given input.

Now time for our final step! We need to define a function that is going to generate all possible substitutions for a proposition by extracting its variables, removig duplicates from this list, generating all possible lists of ligical values for this many variables, and then we will zip the list of variables with each of the results. Some things to note first:
  - we will remove duplicates using the function rmdups
  - we will generate all possible lists of logical values by using our funtion bools we defined above
  
Our function:
```haskell
subsets :: Prop -> [Subst]
subsets p = map (zip vs) (bools (length vs)) where vs = rmdups (vars p)
```

So, if we call our function 'subsets' on our proposition 'p2' our output would be:
```haskell
> subsets p2
[[('A', False), ('B', False)],
 [('A', False), ('B', True)],
 [('A', True), ('B', False)],
 [('A', True), ('B', True)]]
```

FINALLY! We need to find out if our propostion is always true. We do this by defing a function that will check if our propostion evaluates to True for all possible substitutions.
  - we are able to find all possible substitutions with the functions we have defined above. YAY!

We can declare and define our final function as follows:
```haskell
isTrue :: Prop -> Bool
isTrue p = and [eval s p | s <- subsets p]
```

Lets see how our function works with all of our propostions defined above:
```haskell
> isTrue p1
False

> isTrue p2
True

> isTrue p3
False

> isTure p4
True
```

And we done!


#### Dates:
- Concept Stage: 10/19
- Definition Stage: 10/29
- Development Stage: 11/28
- Testing Stage: 12/7


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
