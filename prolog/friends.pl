likes(wallace, cheese).
likes(grommet, cheese).
likes(wendolene, sheep).

friends(X, Y) :- \+(X = Y), likes(X, Z), likes(Y, Z).