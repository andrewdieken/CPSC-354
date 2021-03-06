# Simply Haskell Calculator
This is the read me for our groups simply Haskell calculator


To start off our project our group wanted to create a simply calculator using our programming language, Haskell. We wanted to build this first because there was pleaty of documentation and the concepts were fairly easy to grasp.

### Run Instructions
1. First you will need to download [Haskell](https://www.haskell.org/platform/mac.html)
2. You will need to download the [calculate.hs](https://github.com/andrewdieken/CPSC-354/blob/master/calculator.hs) file
3. Once steps 1-2 are complete, all you need to do is run the command `runghc calculate.hs` in terminal
4. The program will wait until it is given input

Example input:
-  `12 + 4`
- `12+4`
- `45 * 8`
- `45 - 8`
- `12 / 4`
- ``


### Code Breakdown
```haskell
-- Authors: Andrew Dieken, Matt McCortney, Alberto Garibay
-- Name: Simply Haskell Calculator
```
Here we are importing all of our library which we will be working with.
[Text.Parsec](http://hackage.haskell.org/package/parsec-3.1.13.0/docs/Text-Parsec.html) is a parsing libray within Haskell which we will use to help us parse the user input.
```haskell
import Text.Parsec
import Text.Parsec.String
import Text.Parsec.Token
import Text.Parsec.Language
import Text.Parsec.Expr
```

Here we have defined a lexer, which is a Token Parser. Simply put, it will return a set of parsec parsers for us. It will parse any of of the characters in the string "+-*/"
```haskell
lexer :: TokenParser()
lexer = makeTokenParser (javaStyle { opStart = oneOf "+-*/", opLetter = oneOf "+-*/" })
```

Here we have our number parser function. We will receive either a natural number or float. 
- If we get an integer on the left we return `fromIntegral` which will bring it to a float
- If we get a number on the right then we just return that number
```haskell
parseNumber :: Parser Double
parseNumber = do
  val <- naturalOrFloat lexer
  case val of
    Left i -> return $ fromIntegral i
    Right n -> return $ n
```

Here we have our expression parser. We give it a list of operators and operator functions. It allows us to specify associativity and prefix or postfix operators.
```haskell
parseExpression :: Parser Double
parseExpression = (flip buildExpressionParser) parseTerm $ [
    [ Prefix (reservedOp lexer "-" >> return negate)
    , Prefix (reservedOp lexer "+" >> return id) ]
    , [ Infix (reservedOp lexer "*" >> return (*)) AssocLeft
    , Infix (reservedOp lexer "/" >> return (/)) AssocLeft ]
    , [Infix (reservedOp lexer "+" >> return (+)) AssocLeft
    , Infix (reservedOp lexer "-" >> return (-)) AssocLeft ]]
```

Here we have our parse term function. It will parse an expression with parenthesis or it will parse a number.
```haskell
parseTerm :: Parser Double
parseTerm = parens lexer parseExpression <|> parseNumber
```

Here we have our parse input function. Similarly to the parseTerm function it will take in a double. It will run whitespace from the lexer and then parse and expression through the function `parseExpression`. It will return the value it parses.
```haskell
parseInput :: Parser Double
parseInput = do
  whiteSpace lexer
  n <- parseExpression
  eof
  return n
```

Here we have our calculate function. It takes in a string and returns a string. This function will call the function `parseInput` defined above. `s` is the input that was given to `calculate`.
```haskell
calculate :: String -> String
calculate s =
  case ret of
    Left e -> "error: " ++ (show e)
    Right n -> "answer: " ++ (show n)
  where
    ret = parse parseInput "" s
```

This is our `main` function. It will map our function `calculate` over the number of strings returned by `lines`.
```haskell
main :: IO ()
main = interact (unlines . (map calculate) . lines)
```
