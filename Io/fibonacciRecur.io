valueAt := method (position, cycles, currentValue, nextValue,

	if (cycles == position,
		"The value at position #{position} is #{currentValue} " interpolate  println
		,
		valueAt(position, cycles + 1, nextValue, nextValue + currentValue)
	);
)

fib := method( position, valueAt(position, 0,0,1))

fib(1)
fib(2)
fib(3)
fib(4)
fib(4)
fib(5)
fib(6)
fib(7)


