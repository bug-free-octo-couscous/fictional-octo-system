data Var
    = N String
    | Num Int
    deriving (Show)
data Form
    = Val [Form]
    | X Int Var
    | E Form String
    deriving (Show)

myval :: Form
myval = (E (Val [(X 1 (Num 1))]) "myval") -- myval = 1
myline :: Form
myline = (E (Val [(X 1 (N "n"))]) "myline") -- myline = n 