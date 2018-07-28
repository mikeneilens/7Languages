
#sum up numbers in each list 
#then sum up the list of numbers

List sumTwoD := method( self map( sum ) sum ) 

testList := list( list(1,2,3,4), list(4,5,6,7) )

total := testList sumTwoD
" #{testList} has a total value of #{total}" interpolate println 
