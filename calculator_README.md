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
Text.Parsec is a parsing libray within Haskell which we will use to help us parse the user input
- [Text.Parsec](http://hackage.haskell.org/package/parsec-3.1.13.0/docs/Text-Parsec.html)
```haskell
import Text.Parsec
import Text.Parsec.String
import Text.Parsec.Token
import Text.Parsec.Language
import Text.Parsec.Expr
```

```haskell
lexer :: TokenParser()
lexer = makeTokenParser (javaStyle { opStart = oneOf "+-*/%", opLetter = oneOf "+-*/%" })
```

```haskell
parseNumber :: Parser Double
parseNumber = do
  val <- naturalOrFloat lexer
  case val of
    Left i -> return $ fromIntegral i
    Right n -> return $ n
```

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

```haskell
parseTerm :: Parser Double
parseTerm = parens lexer parseExpression <|> parseNumber
```

```haskell
parseInput :: Parser Double
parseInput = do
  whiteSpace lexer
  n <- parseExpression
  eof
  return n
```

```haskell
calculate :: String -> String
calculate s =
  case ret of
    Left e -> "error: " ++ (show e)
    Right n -> "answer: " ++ (show n)
  where
    ret = parse parseInput "" s
```

```haskell
main :: IO ()
main = interact (unlines . (map calculate) . lines)
```
