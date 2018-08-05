
#This causes K:V to be translated into atPutNumber(K,V)
OperatorTable addAssignOperator(":", "atPutNumber")

#If you have {f1(x),f2(y),f3(z)} then doString executes "Map f1(x)", "Map f2(y), Map f3(z)"
curlyBrackets := method(
	r := Map clone
	"The functions passed to the curlyBrackets are:" println
	call message println
	call message arguments foreach(arg,
		r doMessage(arg)
	) 
)

#This is a custom atPut that strips quotes of the key before using the key
Map atPutNumber := method(
	self atPut(
		call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
		call evalArgAt(1)
	)
)

s := File with("phonebook.txt") openForReading contents
"The test data is:" println
s println
phoneNumbers := doString(s)
phoneNumbers keys println
phoneNumbers values println
