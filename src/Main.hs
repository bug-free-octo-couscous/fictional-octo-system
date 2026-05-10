data Form
    = Formula Form Form
    | Name String
    | Val Form Form
    | X Int
    | Dim Int
    deriving (Show)

myFormula1 :: Form
myFormula1 = Formula (Name "a") (Val (X 1) (Dim 1))
myFormula2 :: Form
myFormula2 = Formula (Name "b") (Val (X 1) (Dim 1))
myFormula3 :: Form
myFormula3 = Formula (myFormula1) (myFormula2)
myFormula4 :: Form 
myFormula4 = Formula (Name "c") (myFormula3)

main :: IO ()
main = print myFormula4