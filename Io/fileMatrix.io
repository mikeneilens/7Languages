TwoDimList := List clone
TwoDimList maxX := 0
TwoDimList maxY := 0

TwoDimList dim := method(x,y,
	for(i,1,y, self append(List clone setSize(x) ) 
	 )
	 self maxX = x - 1
	 self maxY = y - 1
)
TwoDimList set := method(x,y,value,
	self testRange(x,y)
	self at(y) atPut(x, value) 
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
	#This wtites out the matrix as a csv. This doesn't work if any values in the matrix contain commas!
	#The first line of the file (line zero) contains the size of the matrix. Plus the values are stored as strings, but they may not be strings in the original matrix.
	matrixFile := File with("matrix.txt")
	matrixFile remove
	matrixFile openForUpdating

	record := "#{self maxX},#{self maxY}" interpolate
	matrixFile write(record,"\n")

	for(x, 0, maxX, 
		for(y, 0, maxY,
			value := self get(x,y)
			record := "#{x},#{y},#{value}" interpolate
			matrixFile write(record,"\n")
		)
	)

	matrixFile close
)

createTwoDimList := method(
	newTwoDimList := TwoDimList clone

	matrixFile := File with("matrix.txt")
	matrixFile openForReading
	matrixFile foreachLine(line, record, 
		x := record split(",") at(0) asNumber
		y := record split(",") at(1) asNumber
		if(line==0,
			newTwoDimList dim(3,4),
		#else
			value := record split(",") at(2) 
			newTwoDimList set(x,y,value)
		 )
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


