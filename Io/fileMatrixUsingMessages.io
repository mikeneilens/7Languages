TwoDimList := List clone
TwoDimList maxX := 0
TwoDimList maxY := 0
TwoDimList messages := List clone

TwoDimList dim := method(x,y,
	for(i,1,y, self append(List clone setSize(x) ) 
	 )
	 self maxX = x - 1
	 self maxY = y - 1

	#You need to ditch everything in the message after the ";"" as otherwise the rest of the code gets incldued in the message, even though its never executed.
	 messageText := call message asString split(";") at(0) 
	 messages append( messageText )
)
TwoDimList set := method(x,y,value,
	self testRange(x,y)
	self at(y) atPut(x, value)

	messageText := call message asString split(";") at(0)
	messages append( messageText )
)
TwoDimList get := method(x,y,
	self testRange(x,y)
	self at(y) at(x) 
)
TwoDimList testRange := method(x,y,
	if( y > self maxY, Exception raise("The Y parameter (#{y}) is too large. Max value for Y is #{self maxY}" interpolate),
		if( x > self maxX, Exception raise("The X parameter (#{x}) is too large. Max value for X is #{self maxX}" interpolate)
		)
	)
)
TwoDimList writeToFile := method(
	matrixFile := File with("matrix.txt")
	matrixFile remove
	matrixFile openForUpdating

	self messages foreach(messageText, 
		matrixFile write(messageText,"\n")
	} 

	matrixFile close
)

createTwoDimList := method(
	newTwoDimList := TwoDimList clone

	matrixFile := File with("matrix.txt")
	matrixFile openForReading

	matrixFile foreachLine(record, 
		messageText := "newTwoDimList  " .. record 
		doMessage( Message fromString(messageText)) 
	)
	matrixFile close
	newTwoDimList
)

twoDimList := TwoDimList clone
twoDimList dim(3,4)

twoDimList set(0,1,"hello")
"the element at (0,1) is #{twoDimList get(0,1)}" interpolate println

twoDimList set(0,2,"sucker")
"the element at (0,2) is #{twoDimList get(0,2)}" interpolate println

twoDimList set(2,3,"goodbye")
"the element at (2,3) is #{twoDimList get(2,3)}" interpolate println

twoDimList writeToFile
anotherTwoDimList := createTwoDimList
"the element at (0,1) in the retrieved twoDimList is #{anotherTwoDimList get(0,1)}" interpolate println
"the element at (0,2) in the retrieved twoDimList is #{anotherTwoDimList get(0,2)}" interpolate println
"the element at (2,3) in the retrieved twoDimList is #{anotherTwoDimList get(2,3)}" interpolate println


