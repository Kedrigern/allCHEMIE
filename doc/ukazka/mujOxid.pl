:-consult('../../tabulka.pl'). %pripoji tabulku prvků.

vstup( Prvek, N, o, M ) :-
   member(N,[1,2]),
   member(M,[1,2,3,4,5,7]),
   prvek( _, Prvek, Jmeno, _, Sk, _ ),
   not(Sk == a8), % dulezite je male a v a8, jinak by se jednalo o promennou
   Pstrana is(abs(-2*M)), %absolutni hod. prave strany
   X is(Pstrana / N), % (Lstrana := X*N) == Pstrana
   nabyvaOxCisla(Jmeno,X),
   !, %tzv. řez, zabraní Prologu hledat další alternativy
   priponSt(X,Koncovka), 
   write('oxid '),write(Jmeno),write('-'),write(Koncovka).

