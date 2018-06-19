hash = {:a => "first item", :b => "second item", :c => "third item"}

array = hash.inject( [] ) {|newArray, item| newArray.push(item[1])}
puts array.class
puts array

