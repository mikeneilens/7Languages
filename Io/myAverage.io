
List containsOnlyType := method( typeName,  
   self reduce (xs, x, if (x type == typeName, xs and true, false ))
)

List myAverage := method(
	if(self size > 0, 
		if (self containsOnlyType("Number"),
			self average,
			Exception raise("The list contains an item which is not a number")
		},
	0)
)

l := List clone
average := l myAverage
"average of #{l} is #{average}" interpolate println

l := list(1,2,"three",4)
e := try( 
	average := l myAverage;
	"average of #{l} is #{average}" interpolate println
)
e catch(Exception, "The list #{l} had a problem. #{e error}" interpolate  println)

l := list(1,2,3,4)
e := try( 
	average := l myAverage;
	"average of #{l} is #{average}" interpolate println
)
e catch(Exception, "The list #{l} had a problem. #{e error}" interpolate  println)