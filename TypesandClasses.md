# Types of Classes

  ## Basic Concepts
  
    A type is a collection of related values. An example would be that type **Bool** contains two values **False** and **True**.
    
    ```
    
    False :: Bool
    
    True :: Bool
    
    not :: Bool -> Bool
    ```
    
    The symbol :: can be used with expressions that have not yet been evaluated. An example would be the notation e :: T means that the evalutation of the expression e will produce a value of type T.
    
    ```
    not False :: Bool
    
    not True :: Bool
    
    not (not False) :: Bool
    ```
    
    In Haskell every expression must have a type. This is calculated prior by a process called *type inference*. Type inference is basically stating that if there is a function **f** that maps arguments of type **A** to results ot type **B** and then you have **e** which is an exprssion of type **A** then the application of " f e " has type B:
    
    ```
    f :: A -> B e :: A
    __________________
      f e :: B
    ```
      
  ## Basic Types

  ## List Types

  ## Tuple Types

  ## Function Types

  ## Curried Functions

  ## Polymorphic Types

  ## Overloaded Types

  ## Basic Classes
