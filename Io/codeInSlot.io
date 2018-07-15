MyObject := Object clone
MyObject name := "fred"
MyObject code := "MyObject name println"
("My code is '" .. (MyObject code) .. "'" ) println 
doString(MyObject code)