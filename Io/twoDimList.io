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
	self testRange(x,y);
	self at(y) atPut(x, value) 
)
TwoDimList get := method(x,y,
	self testRange(x,y);
	self at(y) at(x) 
)
TwoDimList testRange := method(x,y,
	if( y > self maxY, Exception raise("The Y parameter is too large. Max value for Y is #{self maxY}" interpolate),
		if( x > self maxX, Exception raise("The X parameter is too large. Max value for X is #{self maxX}" interpolate)
		)
	)
)

TwoDimList transpose := method(
	newList := TwoDimList clone	
	newList dim(self size, self at(0) size)
	for (x, 0, self maxX,
		for (y, 0, self maxY,
			newList set(y,x, self get (x,y ))
		)
	)
	newList
)


twoDimList := TwoDimList clone
twoDimList dim(3,4)

e := try (twoDimList testRange(1,4), "exception not raised" println)
e catch(Exception, e error println )

e := try (twoDimList testRange(3,1), "exception not raised" println)
e catch(Exception, e error println )

"size of twoDimList is #{twoDimList size}." interpolate println
"size of elements of twoDimList is #{twoDimList at(0) size}." interpolate println

twoDimList set(0,1,"hello")
"the element at (0,1) is #{twoDimList get(0,1)}" interpolate println

twoDimList set(0,2,"sucker")
"the element at (0,2) is #{twoDimList get(0,2)}" interpolate println

twoDimList set(2,3,"goodbye")
"the element at (2,3) is #{twoDimList get(2,3)}" interpolate println

newTwoDimList := twoDimList transpose

"the element at (1,0) in transposed twoDimList is #{newTwoDimList get(1,0)}" interpolate println
"the element at (2,0) in transposed twoDimList is #{newTwoDimList get(2,0)}" interpolate println
"the element at (3,2) in transposed twoDimList is #{newTwoDimList get(3,2)}" interpolate println

