

squareBrackets := method(
	newList := List clone
	call message arguments foreach(arg,
		newList append( doMessage(arg))
	) 
	newList
)



myList := [1,2,3,4] 
"My new list is" println 
myList println
"Which has type #{myList type}" interpolate println

myList2 := [1,2 + 3,3,4]
myList2 println  
