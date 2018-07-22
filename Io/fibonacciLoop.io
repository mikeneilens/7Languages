fib := method (
	position := doMessage(call message argAt(0));
	currentValue := 0;
	nextValue := 1;
	for (i, 1, position, 
		newCurrentValue := nextValue; 
		nextValue = nextValue + currentValue; 
		currentValue = newCurrentValue
	);
	"The value at position #{position} is #{currentValue} " interpolate  println;
)

fib(1)
fib(2)
fib(3)
fib(4)
fib(5)
fib(6)
fib(7)