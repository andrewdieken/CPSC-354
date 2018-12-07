# Loops

There are no loops in Haskell. 
- Haskell is a Declarative language.
  - Imperative: give a sequence of operations which tell you step by step what to do.
  - Declarative: what the program must accomplish.
- The only way to iterate is with recursion.

- Example: length function

Python
```python
def length(arr):
  length = 0
  for item in arr:
    length += 1
  return length
```
Haskell
```haskell
length :: [a] -> Int
length [] = 0
length (_:xs) = 1 + length xs
```

- Example: sum function

Python
```python
def sum(arr):
  sum = 0
  for item in arr:
    sum += item
  return sum
```
Haskell
```haskell
sum :: [a] -> Int
sum [] = 0
sum (_:xs) x + sum xs
```

- Example: fibonacci

Python
```python
def fib(n):
  if n == 0:
    return 0
  elif n == 1:
    return 1
  else:
    return fib(n-1) + fib(n-2)
```
Haskell
```haskell
fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib x = fib(x-1) + fib(x-2)
```
