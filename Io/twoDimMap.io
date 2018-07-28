TwoDimMap := Map clone
TwoDimMap maxX := 0
TwoDimMap maxY := 0

TwoDimMap dim := method(x,y,
	 self maxX = x - 1
	 self maxY = y - 1
)
TwoDimMap keyFor := method(x,y, 
	self testRange(x,y)
	(x asString) .. "," .. (y asString)
)
TwoDimMap xFor := method(key, key split(",") at(0) asNumber )
TwoDimMap yFor := method(key, key split(",") at(1) asNumber )

TwoDimMap set := method(x,y,value,
	key := self keyFor(x,y)
	self atPut(key, value) 
)
TwoDimMap get := method(x,y,
	key := self keyFor(x,y)
	self at(key) 
)
TwoDimMap testRange := method(x,y,
	if( y > self maxY, Exception raise("The Y parameter (#{y}) is too large. Max value for Y is #{self maxY}" interpolate),
		if( x > self maxX, Exception raise("The X parameter (#{x}) is too large. Max value for X is #{self maxX}" interpolate)
		)
	)
)

TwoDimMap transpose := method(
	newMap := TwoDimMap clone	
	newMap dim(self maxY + 1, maxX + 1)

	self keys foreach(key,
		value := at(key) 
		newMap set(self yFor(key),self xFor(key),value)
	)

	newMap
)

TwoDimMap := TwoDimMap clone
TwoDimMap dim(3,4)

e := try (TwoDimMap testRange(1,4), "exception not raised" println)
e catch(Exception, e error println )

e := try (TwoDimMap testRange(3,1), "exception not raised" println)
e catch(Exception, e error println )

"size of TwoDimMap is #{TwoDimMap maxY + 1}." interpolate println
"size of elements of TwoDimMap is #{TwoDimMap maxX + 1}." interpolate println

TwoDimMap set(0,1,"hello")
"the element at (0,1) is #{TwoDimMap get(0,1)}" interpolate println

TwoDimMap set(0,2,"sucker")
"the element at (0,2) is #{TwoDimMap get(0,2)}" interpolate println

TwoDimMap set(2,3,"goodbye")
"the element at (2,3) is #{TwoDimMap get(2,3)}" interpolate println

newTwoDimMap := TwoDimMap transpose

"the element at (1,0) in transposed TwoDimMap is #{newTwoDimMap get(1,0)}" interpolate println
"the element at (2,0) in transposed TwoDimMap is #{newTwoDimMap get(2,0)}" interpolate println
"the element at (3,2) in transposed TwoDimMap is #{newTwoDimMap get(3,2)}" interpolate println

"the element at (2,2) in transposed TwoDimMap is #{newTwoDimMap get(2,2)}" interpolate println

