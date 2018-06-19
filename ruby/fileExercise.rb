afile = File.open("test.file","r")
if afile
	content = afile.sysread(20)
	puts content
else
	puts "can't open file"
end

File.open("test.file","r") do |afile|
	if afile
		content = afile.sysread(20)
		puts "using blocks the conent is #{content}"
	else
		puts "can't open file using a blocks"
	end
end