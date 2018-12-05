# Types of Classes

  ## Basic Concepts
  
   A type is a collection of related values. An example would be that type **Bool** contains two values **False** and **True**.
    
    False :: Bool
    
    True :: Bool
    
    not :: Bool -> Bool
   The symbol :: can be used with expressions that have not yet been evaluated. An example would be the notation e :: T means that the evalutation of the expression e will produce a value of type T.
    
    not False :: Bool
    
    not True :: Bool
    
    not (not False) :: Bool
   In Haskell every expression must have a type. This is calculated prior by a process called *type inference*. Type inference is basically stating that if there is a function **f** that maps arguments of type **A** to results ot type **B** and then you have **e** which is an exprssion of type **A** then the application of " f e " has type B:
    
    f :: A -> B e :: A
    __________________
      f e :: B
    
  An example of this would be the typing **not False :: Bool** can be inferred due to the fact that **not :: Bool -> Bool**. Though this will not work with something like **not 3** because it does not fall under the type of Bool. (**3 :: Bool**) This would cause a type error. 
  
  Thought type inference precedes evaluation and Haskell programs are type safe in the snese that type erros can never occur during evaluation. For example typer inference detects a very large class of program erros and this feature is what makes Haskell so useful.
  
  ## Basic Types
  
  **Bool - logical values**
  A bool type contains the two logical values *Flase* and *True*
  
  **Char - single characters**
  A char type contains all single characters in the Unicode system. It contains all the characters on a normal English keyboard

  **String - strings of a character**
  A string type contains all sequences of characters.
  
  **Int - fixed-precision integers**
  This type contains integers with a fixed amount of memory being used for their storage. It contains any integer from the range -2^63 to 2^63 -1.
  
  **Integer - arbitrary-precision integers**
  This type contains all integers with as much memory as necessary being used for their storage. This avoids the impostiiton of lower and upper limits on the range of numbers. The difference between **Int** and **Integer** is the performance, **Int** is faster as most computers have built in hardware for fixed precision integers whereas arbitrary integers are usually processed using the slower medium of software. 
  
  **Float - single precision floating point numbers**
  This type contains numbers with a decimal point and with a fixed amount of memory being used for their storage. The term floating point comes from the fact that the number of digits permitted after the decimal point depends upon the size of the number. 
  
  **Double - double precision floating point numbers**
  This type is similiar to **Floati** except that twice as much memory is used for storage of these numbers to increase therir precision. 
  
  ## List Types
  
  A list is a sequence of elements of the same type, with the elements being enclosed in square parentheses and separated by commas. 
  
  Examples of lists in Haskell:
  
  ```
  [False,True,False] :: [Bool]
  
  ['a','b','c','d'] :: [Char]
  
  ["One","Two","Three"] :: [String]
  ```
  In haskell you can have lists of lists
  Ex: 
  
  ```
  [['a','b'],['c','d','e']] :: [[Char]]
  ```
  
  ## Tuple Types
  
  A tuple is a finite sequence of components of possibly different types, with the components being enclosed in round parentheses and separated by commas. 
  
  Example of Tuples:
  
  ```
  (False,True) :: (Bool:Bool)
  
  (False,'a',True) :: (Bool,Char,Bool)
  
  ("Yea",True,'a') :: (String,Bool,Char)
  ```
  
  The number of components in a tuple is called its arity. The tuple (0 of arity zero is called the empty tuple, tuples of arity two are called pairs, tuples of arity three are called triples. 

  ## Function Types
  
  A function is a mapping from arguments of one type to results of another type. 
  Example of a function:
  
  ```
  not :: Bool -> Bool
  
  even :: Int -> Bool
  ```
  
  The library function *even* decideds if an integer is even and because there are no restrictions on the types of the arguments and the results of a function the simple notation of a function with a single argument and a single result is already sufficent to handle the case of multiple arguments and results. 
  
  Another exmpale would be to creat a function called *add* that calculates the sum of a pair of integers and a function *zeroto* that returns the list of integers from zero toa give limit. 
  
  ```
  add :: (Int,Int) -> Int
  add(x,y) = x+y
  
  zeroto :: Int -> [Int]
  zeroto n = [0..n]
  ```
  There are no restrictions that functions must be total on their argument type, in the sense that there may be some arguments for which the result is not defined. 

  ## Curried Functions
  A curried function is a function with multiple arguments that can also be handled in another. Functions are free to retunr functions as reults so it allows this to be possible. 
  Example:
  
  ```
  add' :: Int -> (int -> Int)
  add' x y = x+y
  ```
  The type state that *add'* is a fucntion that takes an argument of type *Int* and returns a result that is a function of type *Int -> Int*. 
  
  Functions with more than two arguments can also be handled using the same technique by returing functions that can return functions and so on. 
  Example: 
  
  ```
  mult :: Int -> (int -> (Int -> Int))
  
  mult x y z = x*y*z
  ```
  
  Functions that take their arguments one at a time are called curried functions. Curried functions are more flecible thatn functions on tuples, becuase useful functions can often be made by parially applying a curried function with less thatn its full complement of arguments. 
  
  ## Polymorphic Types
  
  Before getting into polymorphic types it is important to understant type varibales. Type variables must begin with a lower-case letter and are usually simple named. 
  
  So a type that contains one or more type varibales is called poulmorphic as is an expression with such a type. 
  
  An example would be the legnth function that calculets the length of any list ddespite its type of the elements within the list.
  
  ## Basic Classes
  
  A class is a collection of types that support certain overloaded operations called methods. Haskel provides a numver of basic classes that are built in to the language.
  
  Some of these consist of:
  - Eq-equality types
  - Ord-ordered types
  - Show-showable types
  - Read-readable types
  - Num-numeric types
  - Integral-integral types
  - Fractional-fractional types
  
  
