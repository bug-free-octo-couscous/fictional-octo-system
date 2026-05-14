$$
{aleph_0}^{aleph_0} > aleph_0
$$

Limit $\mathscr{L}$
<br>
that changes relatively
<br>
for example 
<br>
for person A who's coginiton limit is $aleph_0$
<br>
see $\mathscr{L}$ as $aleph_0$
<br> 
for person B who's coginiton limit is ${aleph_0}^{aleph_0}$
<br>
see $\mathscr{L}$ as ${aleph_0}^{aleph_0}$
<br>
```haskell
data Var
    = N String
    | Num Int
    deriving (Show)
data Form
    = Val [Form]
    | X Int Var
    | I Int Var
    | E Form String
    deriving (Show)

data Comp
    = CompE Form Form String

myval :: Form
myval = (E (Val [(X 1 (Num 1))]) "myval") -- (1) R^1
mypoint :: Form
mypoint = (E (Val [(X 1 (Num 1)), (X 2 (Num 1)), (X 3 (Num 1))]) "mypoint3d") -- (1,1,1) R^3
mypoint_complex_plane :: Form
mypoint_complex_plane = (E (Val [(X 1 (Num 1)), (I 1 (Num 1))]) "mypoint_complex_plane") -- (1+i) C^1
mypoint_complex_plane3d :: Form
mypoint_complex_plane3d = (E (Val [(X 1 (Num 1)), (I 1 (Num 1)), (X 2 (Num 1)), (I 2 (Num 1)), (X 3 (Num 1)), (I 3 (Num 1))]) "mypoint_complex_plane") -- (1+i,1+i,1+i) C^3
mypoint_complex_plane_more_imaginary :: Form
mypoint_complex_plane_more_imaginary = (E (Val [(X 1 (Num 1)), (I 1 (Num 1)), (I 2 (Num 1))]) "mypoint_complex_plane") -- (1+i+j) R^2 + I^2
myComp :: Comp
myComp = (CompE myval mypoint "my_new_space")
myline :: Form
myline = (E (Val [(X 1 (N "n"))]) "myline") -- myline = n 
```