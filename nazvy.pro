%% OXID 
%% C_1^iv O_2^-ii	
%%    +4     -4	

oxid(_) :- write('[info] Zadejte predikat oxid(prvek,koncovka). , tedy s dvema argumenty.').
oxid(Prvek, Koncovka) :-
	priponSt(Leva, Koncovka),	%% do promenne Leva ulozi cislo odpovidajici koncovce, cili v oxidu uhlicitem 4
	prvek(_, Sm, Prvek,_,_,_),	%% zjistim jaky je to prvek
	nabyvaOxCisla(Sm,Leva),		%% overim oxid. cislo
	spoctiOxid(Leva, N, M),		%% N je pocet kysliku, M je pocet prvku, oxid. cislo kysliku je vzdy -ii
	!,write(Sm), vypis(N), write(o), vypis(M).
	
spoctiOxid(Prv, Np, No) :- 
	member(No,[1,2,3,4,5,6,7,8]),	%% pocet kysliku muze byt libovolny, jeho oxid cislo vzdy -ii
	(No is(Prv / 2) , Np = 1);	%% N = 1 cili Leva / 2 je pocet kysliku (o)
	(No =  Prv      , Np = 2).	%% N = 2 cili 		

hydroxid(_) :- write('[info] Zadejte predikat hydroxid(prvek,koncovka). , tedy s dvema argumenty.'), fail.
hydroxid(Prvek,Koncovka) :-
	priponSt(Leva, Koncovka),
	prvek(_, Sm, Prvek, _ , _,_),
	nabyvaOxCisla(Sm,Leva),
	!,write(Sm), write('(oh)'), vypis(Leva).

%% PEROXID
peroxid(_) :- write('[info] Zadejte predikat peroxid(prvek,koncovka). , tedy s dvema argumenty.'), fail.
peroxid(Prvek, Koncovka) :- 
	priponSt(Leva,Koncovka),
        prvek(_, Sm, Prvek,_,_,_),      %% zjistim jaky je to prvek
	nabyvaOxCisla(Sm,Leva),         %% overim oxid. cislo
	(
		(Leva =:= 2, N is 2);
		(N is 2)
	),
	!,write(Sm), vypis(N), write(o), vypis(N).
	

%% HALOGENIDY
fluorid(Prvek, Koncovka) :- halogenidPom(Prvek,f, Koncovka).
chlorid(Prvek, Koncovka) :- halogenidPom(Prvek,cl, Koncovka).
bromid(Prvek, Koncovka)  :- halogenidPom(Prvek,br, Koncovka).
jodid(Prvek, Koncovka)  :- halogenidPom(Prvek,i, Koncovka).
pesulfid(Prvek, Koncovka)  :- halogenidPom(Prvek,s, Koncovka).
halogenid(H,Prvek,Koncovka) :-
		( H = fluorid, fluorid(Prvek, Koncovka) ) ;
		( H = chlorid, chlorid(Prvek, Koncovka) ) ;
		( H = bromid, bromid(Prvek, Koncovka) ) ;
		( H = jodid, jodid(Prvek, Koncovka) );
		( H = sulfid, sulfid(Prvek, Koncovka) ).
halogenidPom( Prvek, ZnackaHalogenu, Koncovka) :-
	priponSt( K ,Koncovka),
	prvek(_,P,Prvek,_,_,Sez ),
	member(K,Sez),
	!,write(P),write(ZnackaHalogenu),write(K).

%% KYSELINA vizualni podpora
%%       i  -ii
%%	H S O
%%	 2 1 4
kyselina(Prvek, Koncovka) :-
	priponKys(Leva, Koncovka),	%% zjisitime cislo koncovky
	prvek(_, Sm, Prvek, KV,_ , _),
	( KV == nek ; KV == pol ),	%% Prvek musi byt kov ci polokov
	spoctiKys(Leva, NH, M, K),
	nabyvaOxCisla(Sm,M),
	!,write(h), vypis(NH), write(Sm), vypis(M), write(o), vypis(K).

%% TODO: priority, ale jak?
spoctiKys(Leva, NH, MP, Ko) :- 		/* NH - pocet vodiku, MP - pocet kyselinotvorneho prvku, Ko - pocet kysliku */
        member(MP,[1,2,3]),                      %% pocet prvku
        member(NH,[1,2,3,4,5,6]),                %% pocet vodiku
        member(Ko,[1,2,3,4,5,6,7]),              %% pocet kysliku
	L is (Leva*MP+NH), 
	P is (Ko*2),
	L == P.


%% SUL vizualni podpora
%% chlorid sodny
%% 	  I  -I
%%	Na Cl
%%	  1  1




%% pomocny predikat, ktery vypisuje cisla vetsi nez 1
vypis(X) :- 
	X == 1  ;	%% 1 se nevypisuje
	write(X).	%% zbytek ano
