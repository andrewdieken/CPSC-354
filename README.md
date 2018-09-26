# CPSC-354
This is a blog for the class CPSC-354 Programming Languages. Team members include: Andrew Dieken, Matt McCortney, Alberto G. 

# A Breif History of Haskell

# Exercises

## 1)Termination
**Exercise:** Show that the two programs

    while m =/= n do
      if m > n then m := m — n else n := n — m

and

    while m =/= n  do
      if m > n then m : = m — n
      else begin h :=m; m :=n; n := h end

terminate. Are there any assumptions you need do make the argument work?
