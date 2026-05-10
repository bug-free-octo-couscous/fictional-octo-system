data Form
    = Formula Form
    | Val Form Form
    | X Int
    | Dim Int
    | T Form String
    | Fill Form Form
    deriving (Show)

myFormula1 :: Form
myFormula1 = Formula (T (Val (Dim 1) (X 1)) "a1") -- 1d point
myFormula2 :: Form
myFormula2 = Formula (T (Val (Val (Dim 1) (X 1)) (Val (Dim 2) (X 2))) "a2") -- 2d point
myFormula3 :: Form
myFormula3 = Formula (T (Val (Val (Val (Dim 1) (X 1)) (Val (Dim 2) (X 1))) (Val (Dim 3) (X 1))) "a3") -- 3d point
myFormula12 :: Form
myFormula12 = Formula (T (Val (Val (Dim 1) (X 1)) (Val (Dim 1) (X 2))) "a12") -- line
mycube1 :: Form
mycube1 = Formula (Fill (Val (Val (Val (Dim 1) (X 1)) (Val (Dim 2) (X 2))) (Val (Dim 3) (X 1))) (Val (Val (Val (Dim 1) (X 2)) (Val (Dim 2) (X 2))) (Val (Dim 3) (X 3)))) -- cube
main :: IO ()
main = do
    print myFormula1
    print myFormula2
    print myFormula3
    print myFormula12
    print mycube1