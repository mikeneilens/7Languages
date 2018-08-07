Builder := Object clone
Builder indentLevel := 0
Builder textForIndents := "    "

Builder indentText := method(
	indentedspace := textForIndents repeated(indentLevel)
)

Builder forward := method(
	writeln( indentText, "<", call message name, ">")	
	indentLevel = indentLevel + 1
	call message arguments foreach(
		arg,
		content := self doMessage(arg);
		if (content type == "Sequence", writeln(indentText, content) )
	)
	indentLevel = indentLevel - 1
	writeln(indentText, "</", call message name, ">")
)

Builder ul(
	li("Io"),
	li("Lua"),
	li(  p("Javascript")
	)
)

