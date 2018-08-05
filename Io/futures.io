futureResult := URL with("http://google.com/") @fetch

writeln("do something immediately while the fetch goes on in the background")

writeln("This will block until the result is available.")

writeln("fetched ", futureResult.size, " bytes")