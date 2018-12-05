# Defining Functions 

## Conditional Expressions
haskell provides a range of different ways to define functions that choose between a number of possible results. The simplest are conditional expresssions whare you usea a logical expression called a condition to choose between two results of the same type. If the condition is True the the first result is chosen and if it is False then the second result is chosen. 
Example:

```
abs :: Int -> Int
abs n = if n >= 0 then n else -n
```
Conditional expressions may be nested in the sense that they can contain other conditional expressions.
Note that unlike in some programming languages, conditional expressions in Haskell must always have an else branch.

## Guarded Equations
A guarded equations is a sequence of logical expressions called guards and they are used to choose between a sequence of results of the same type. If the first guard is True, then the first result is chosen; otherwise if the second is True then the second result is chosen. 
Example:

```
abs n | n >= 0    = n
      | otherwise = -n
```

The symbol | is read as "such that" and the guard otherwise is defined in the standard prelude simply by otherwise = True. 

## Pattern Matching
Pattern matching is when a sequence of syntactic expressions called patterns is used to choose between a sequence of results of the same type. If the first pattern is matched then the first result is chosen otherwise if the second is matched then the second is chosen. 
Example: 
```
not :: Bool -> Bool
not False = True
not True = False
```

Functions with more than one argument can alse be defined useing pattern matching in which case the patterns for each argument are matched in order within each equation. 
