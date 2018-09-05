directTrain(saarbruecken,dudweiler). 
directTrain(forbach,saarbruecken). 
directTrain(freyming,forbach). 
directTrain(stAvold,freyming). 
directTrain(fahlquemont,stAvold). 
directTrain(metz,fahlquemont). 
directTrain(nancy,metz).

travelFromTo(StartTown, FinishTown) :- directTrain(StartTown, FinishTown).
travelFromTo(StartTown, FinishTown) :- directTrain(StartTown, InbetweenTown), travelFromTo(InbetweenTown, FinishTown).