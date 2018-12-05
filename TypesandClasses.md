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

  ## Tuple Types

  ## Function Types

  ## Curried Functions

  ## Polymorphic Types

  ## Overloaded Types

  ## Basic Classes
