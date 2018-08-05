Builder := Object clone
Builder forward := method(
	
	# The message isn't recognised so create open and close tag for the message name.
	writeln("<", call message name, ">")	
	call message arguments foreach(
		arg,
		# if the arg is just a primitive like string or number then 
		# content is just the value. 
		# Otherwise content triggers the forward method.
		content := self doMessage(arg);
		if (content type == "Sequence", writeln(content) )
	)
	writeln("</", call message name, ">")
)
Builder ul(
	li("Io"),
	li("Lua"),
	li("Javascript")
	li(1) # this causes <li></li> tags to be written with no content. 
)
