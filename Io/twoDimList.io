TwoDimList := List clone
TwoDimList dim := method(x,y,
	for(i,1,y, self append(List clone setSize(x) ) 
	 )
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
	if( y >= self size, Exception raise("The Y parameter is too large. Max value for Y is #{self size - 1}" interpolate),
		if( x >= self at(y) size, Exception raise("The X parameter is too large. Max value for X is #{self at(y) size - 1}" interpolate)
		)
	)
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

twoDimList set(2,3,"goodbye")
"the element at (2,3) is #{twoDimList get(2,3)}" interpolate println