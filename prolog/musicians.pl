musician('Keith Moon', drummer).
musician('Paul Simon', guitarist).
musician('Paul Simon', pianist).
musician('Ringo Starr', drummer).
musician('Charlie Watts', drummer).
musician('Phil Lynott', bassist).
musician('Bill Wyman', bassist).
musician('John Williams', guitarist).

musicianStyle('Keith Moon', rock).
musicianStyle('Paul Simon', folk).
musicianStyle('Ringo Starr', pop).
musicianStyle('Charlie Watts', jazz).
musicianStyle('Phil Lynott', rock).
musicianStyle('Bill Wyman', rock).
musicianStyle('John Williams', classical).


plays(drummer, drums).
plays(guitarist, guitar).
plays(bassist, bass).
plays(pianist, piano).

playsTheInstrument(Instrument, Name) :- plays(Job,Instrument), musician(Name, Job).

playsInstrumentNotJazz(Instrument, Name) :- plays(Job,Instrument), musician(Name, Job), musicianStyle(Name, Style), \+(Style = jazz).


% playsTheInstrument(guitar, Name) returns all musicians that play a guitar.
% playsInstrumentNotJazz(drums, Name) returns all musicicans that play the drums except Charlie Watts