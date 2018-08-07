Builder := Object clone
Builder indentLevel := 0
Builder textForIndents := "    "

Builder tagIsOpen := false
Builder openTag := method(
	tagIsOpen = true
	"<"
)
Builder closeTag := method(
	tagIsOpen = false
	">"
) 
Builder writeCloseTagIfTagIsOpen := method(
	if (tagIsOpen == true, writeln(closeTag) )
)


Builder indentText := method(
	indentedspace := textForIndents repeated(indentLevel)
)

Builder forward := method(
	writeCloseTagIfTagIsOpen
	write( indentText, openTag, call message name)
	indentLevel = indentLevel + 1
	call message arguments foreach(
		arg,
		content := self doMessage(arg);
		if (content type == "Map"  , 
			writeln( " ", content asAttributes, closeTag)							
			,
		#else
			if (content type == "Sequence", 
				writeCloseTagIfTagIsOpen
				writeln(indentText, content)
			)	
		 )
	)
	indentLevel = indentLevel - 1
	writeln(indentText, "</", call message name, ">")
)

Map asAttributes := method(
	attributes := "" asMutable
	foreach(k,v,
		attributes = attributes .. k .. "=" .. v .. ","
	)
	attributes asMutable removeSuffix(",")
)

testMap := Map clone
testMap atPut("key1","value1")
testMap atPut("key2","value2")

testMap asAttributes println

Builder ul(
	li("Io"),
	li("Lua", "cobol"),
	li(  p(testMap, "Javascript") )
)

