Builder := Object clone
Builder indent := 0
Builder textForIndents := "    "

Builder indentText := method(
	indentedspace := textForIndents repeated(indent)
)

Builder forward := method(
	writeln( indentText, "<", call message name, ">")	
	indent = indent + 1
	call message arguments foreach(
		arg,
		content := self doMessage(arg);
		if (content type == "Sequence", writeln(indentText, content) )
	)
	indent = indent - 1
	writeln(indentText, "</", call message name, ">")
)

Builder ul(
	li("Io"),
	li("Lua"),
	li(  p("Javascript")
	)
)

