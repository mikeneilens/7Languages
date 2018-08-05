slower := Object clone
faster := Object clone

slower start := method(wait(2); writeln("slowly"))
faster start := method(wait(1); writeln("quickly"))

"starting both sequentially" println
slower start; faster start

"starting both asychnronously" println
slower @@start; faster @@start; wait(3)