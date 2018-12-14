-- Authors: Andrew Dieken, Matt McCortney, Alberto Garibay
-- Name: Simply Haskell Calculator


import Text.Parsec
import Text.Parsec.String
import Text.Parsec.Token
import Text.Parsec.Language
import Text.Parsec.Expr

lexer :: TokenParser()
lexer = makeTokenParser (javaStyle { opStart = oneOf "+-*/", opLetter = oneOf "+-*/" })

parseNumber :: Parser Double
parseNumber = do
  val <- naturalOrFloat lexer
  case val of
    Left i -> return $ fromIntegral i
    Right n -> return $ n

parseExpression :: Parser Double
parseExpression = (flip buildExpressionParser) parseTerm $ [
    [ Prefix (reservedOp lexer "-" >> return negate)
    , Prefix (reservedOp lexer "+" >> return id) ]
    , [ Infix (reservedOp lexer "*" >> return (*)) AssocLeft
    , Infix (reservedOp lexer "/" >> return (/)) AssocLeft ]
    , [Infix (reservedOp lexer "+" >> return (+)) AssocLeft
    , Infix (reservedOp lexer "-" >> return (-)) AssocLeft ]]

parseTerm :: Parser Double
parseTerm = parens lexer parseExpression <|> parseNumber

parseInput :: Parser Double
parseInput = do
  whiteSpace lexer
  n <- parseExpression
  eof
  return n


calculate :: String -> String
calculate s =
  case ret of
    Left e -> "error: " ++ (show e)
    Right n -> "answer: " ++ (show n)
  where
    ret = parse parseInput "" s

main :: IO ()
main = interact (unlines . (map calculate) . lines)
