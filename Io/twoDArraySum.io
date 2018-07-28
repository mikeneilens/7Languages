
#sum up numbers in each list using reduce(+)
#then sum up the list of numbers using reduce(+)

List sumTwoD := method( self map( reduce(+)) reduce(+) ) 

testList := list( list(1,2,3,4), list(4,5,6,7) )

total := testList sumTwoD
" #{testList} has a total value of #{total}" interpolate println 
