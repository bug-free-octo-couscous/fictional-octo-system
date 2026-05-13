module Parser where

import Control.Monad (void)
import Data.Void
import Text.Megaparsec
import Text.Megaparsec.Char
import qualified Text.Megaparsec.Char.Lexer as L
import Control.Monad.Combinators.Expr  -- From the parser-combinators package

type Parser = Parsec Void String

sc :: Parser ()
sc = L.space space1 empty empty

lexeme :: Parser a -> Parser a
lexeme = L.lexeme sc

symbol :: String -> Parser String
symbol = L.symbol sc

-- 1. Define what an Expression is
data Expr
  = Variable String
  | Number Int
  | Power Expr Expr
  | Binary Op Expr Expr
  deriving Show

-- 2. Define what operators we support
data Op = Add | Sub | Mul | Div deriving Show

-- 3. Define the top-level structure (e.g., y = x^2)
data Equation = Equation String Expr deriving Show
-- The smallest units: numbers, variables, or expressions in parentheses
term :: Parser Expr
term = choice
  [ between (symbol "(") (symbol ")") expr
  , Variable <$> lexeme (some letterChar)
  , Number <$> lexeme L.decimal
  ]

-- The operator table (ordered by precedence)
operators :: [[Operator Parser Expr]]
operators =
  [ [ InfixL (Power <$ symbol "^") ] -- Highest precedence
  , [ InfixL (Binary Mul <$ symbol "*"), InfixL (Binary Div <$ symbol "/") ]
  , [ InfixL (Binary Add <$ symbol "+"), InfixL (Binary Sub <$ symbol "-") ]
  ]

expr :: Parser Expr
expr = makeExprParser term operators

parseEquation :: Parser Equation
parseEquation = do
  varName <- lexeme (some letterChar)
  void $ symbol "="
  formula <- expr
  return $ Equation varName formula
