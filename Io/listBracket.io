

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
"[1,2 + 3,3,4] is evaluated as " print
myList2 println  

myList3 := [1,"2 + 3",3,4]
"[1,\"2 + 3\",3,4] is evaluated as " print
myList3 println  
"Element at position 1 has type #{myList3 at(1) type}" interpolate println

