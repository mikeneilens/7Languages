valueAt := method (
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

valueAt(1)
valueAt(2)
valueAt(3)
valueAt(4)
valueAt(5)
valueAt(6)
valueAt(7)