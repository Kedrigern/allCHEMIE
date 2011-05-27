%-----
%PRVEK			1 %parametr
%-----
vstup(A) :- vypisPrvek(A).


%----------------------
%SYMLINKY na druhy smer
%----------------------
vstup(oxid,A,B) :- oxid(A,B).
vstup(peroxid,A,B) :- peroxid(A,B).
vstup(hydroxid,A,B) :- hydroxid(A,B).
vstup(kyselina,A,B) :- kyselina(A,B).


%--------
%SYMLINKY		3,3,3,3,3,3,3,2 %parametry
%--------
vstup(h,2,o) :- vstup(h,2,o,1).
vstup(h,c,n) :- vstup(h,1,c,1,n,1).
vstup(n,h,3) :- vstup(n,1,h,3).
vstup(k,c,n) :- vstup(k,1,c,2,n,1).
vstup(Prvek,(oh),N) :- vstup(Prvek,1,(oh),N).
vstup(Prvek, o  ,N) :- vstup(Prvek,1,o,N).
vstup(h, Prvek)     :- vstup(h, 1, Prvek, 1).


%--------
%ORGANIKA
%--------
vstup(c,1,h,4)  :- write(metan).
vstup(c,1,h,3)  :- write(metyl).
vstup(c,2,h,6)  :- write(etan).
vstup(c,2,h,5)	:- write(ethyl).
vstup(c,3,h,8)  :- write(propan).
vstup(c,3,h,7)  :- write(propyl).
vstup(c,4,h,10) :- write(butan).
vstup(c,4,h,9)  :- write(butyl).
vstup(c,11,h,24):- write(undekan). 
vstup(c,12,h,26):- write(dodekan).
vstup(c,N1,h,N2) :- 
	(
		N2 is (N1*2+2),
		reckaPred(N1,Pred), 
		write(Pred),(
		(N1 =< 10, write('-an'))   ;	
		(N1 =< 19, write('-dekan')))
	) ;
	(
		N2 is (N1*2+1),
		reckaPred(N1,Pred), write(Pred),
		(N1 =< 10, write('-yl'))   ;	
		(N1 =< 19, write('-dekan-yl'))
	).
		
%-----------------
%ZVLASTNI %PRIPADY 	4,4 %parametry
%-----------------
vstup(h,2,o,1) :- write(voda).
vstup(n,1,h,3) :- write(amoniak).

%------------------
%SLOUCENINY %VODIKU  	4,4 %parametry
%------------------
vstup(h, N, Prvek, M) :- 			/* A6 a A7 slouceniny vodiku */
	M=1, prvek \= h,
	(
	N = 1 , prvek(_ , Prvek , X , nek , a7 , _ ), 
		write(X), write('ovodík') 
	);
	(
	N = 2, Prvek \= o, prvek( _ , Prvek , X, _ , a6 , _ ), 
		write(X), write('-an')
	).

vstup(Prvek, N, h, M) :- 			/* hydridy, slouceniny s A3-A5, vodik ma -1 */
	integer(N), integer(M),			%TODO: integer
	prvek \= h,
	prvek( _, Prvek, X, _, Sk, _ ),
	N = 1,
	(
	  (Sk == a1; Sk == a2),
	  vycisli(hydrid, X, 1, M, -1)
	);
	(
	  (Sk == a3; Sk == a4; Sk == a5),
 	  write(X), write('-an')				/* zde se pouzivaji mezinarodni nazvy */
	).

%---------
%HYDROXIDY              4 %parametr
%---------
vstup(Prvek, 1, (oh), M) :-                                     /* verze bez zavorek osetri sam Prolog */
        prvek( _ , Prvek , Jmeno , KV , _, _ ),
        KV == kov,
        vycisli(hydroxid, Jmeno, 1, M, -1).

%-------
%PEROXID		4 %parametry
%-------
vstup(Prvek, 2, o, 2) :-
	prvek( _ , Prvek , Jmeno , _ , Sk , _ ),
	(Sk == a1 ; Sk == a2),
	write('peroxid '), write(Jmeno), write('-ny').

%-----
%OXIDY			4 %parametry
%-----
vstup(Prvek, N, o, M) :-
	member(N,[1,2]),
	member(M,[1,2,3,4,5,7]),	/* dle PSCH str. 160, M=6 vynechan schvalne*/
	prvek(_ , Prvek , Jmeno , _ , Sk, _ ),
	not(Sk == a8),
	vycisli(oxid, Jmeno, N, M, -2).

%----------
%HALOGENIDY		4 %parametr
%----------
vstup(Prvek, 1, Halogen, M) :-
	prvek(_,Halogen,_,nek,a7,_),
	member(M,[1,2,3,4,5,6,7,8]),	/* dle PSCH str. 160 */	
	(	
		(Halogen == f , Co = fluorid);
		(Halogen == cl, Co = chlorid);
		(Halogen == br, Co = bromid) ;
		(Halogen == i , Co = jodid)  ;
		(Halogen == s , Co = sulfid)
	),
	prvek(_ , Prvek, Jmeno, _, _ ,_),
	vycisli(Co, Jmeno,1, M, -1).	


%--------
%KYSELINY		4, 5, 6 %parametry
%--------
vstup(h, Prvek, o, K) 	 :- vstup(h, 1, Prvek, 1, o, K).	/* Symlink */
vstup(h, N, Prvek, o, K) :- vstup(h, N, Prvek, 1, o, K).	/* Symlink */
vstup(h, N, Prvek, M, o, K) :-
	member(M,[1,2,3]),			%% pocet prvku
	member(N,[1,2,3,4,5,6]),		%% pocet vodiku	
	member(K,[1,2,3,4,5,6,7]), 		%% pocet kysliku
	prvek(_,Prvek,Jmeno,KV,SK,_),		
	(KV == pol ; KV == nek),		%% je kov ci polokov
	SK \= a8,				%% nesmi byt z A8 skupiny
	ZapornyNab is(-2 * K),
	Pom is(abs((ZapornyNab + N) // M)),	
	reckaPred(N,X), 			%% like: trihydrogen etc., str 162
	priponKys(Pom,Kon),			%% najde priponu
	write('kyselina '), write(X), write('hydrogen '), write(Jmeno), write('-'), write(Kon).

%-----------------
%ZVLASTNI %PRIPADY      6 %parametry
%-----------------
vstup(h,1,c,1,n,1) :- write('kyanovodik').

%----
%SOLI			7 %parametry
%----
vstup(P1,N1,P2,N2,o,N3) :- vstup(P1,N1,P2,N2,o,N3,1).                   /* 6 par */
vstup(P1,N1,P2,N2,o,N3,N4) :- vstup(P1,N1,h,0,P2,N2,o,N3,N4).           /* 7 par */

vstup(P1,N1,P2,N2,o,N3,N4,*,N5,h2o) :- vstup(P1,N1,h,0,P2,N2,o,N3,N4,N5,h2o).
vstup(P1,N1,h,Nh,P2,N2,o,N3) :- vstup(P1,N1,h,Nh,P2,N2,N3).             /* 8 par */

vstup((nh4),N1,h,Nh,P2,N2,o,N3,N4) :-                                     /* 9 par amoniak */
        /* hydro */
        (
	        ( Nh = 0, HYDRO = '' );
        	( reckaPred(Nh,Tmp), string_concat(Tmp,'hydrogen',HYDRO))
        ),
        /* overeni */
        KladnNab is(N1 + Nh),                   /* #amoniky + #vodiku*/
        ZaporNab is(-(KladnNab // N4)),
        aniont(P2,N2,o,N3,Jmen,ZaporNab),
        /* vypis */
        write(HYDRO), write(Jmen), write(' amonný').

vstup(P1,N1,h,Nh,P2,N2,o,N3,N4) :-                                      /* 9 par */
        /* hydro */
        (
        ( Nh = 0, HYDRO = '' );
        ( reckaPred(Nh,Tmp), string_concat(Tmp,'hydrogen',HYDRO))
        ),
        /* overeni */
        not(P1 == h), prvek( _ , P1 , Prvek1 , kov, Sk , _ ),
        /* vypocet */
        ((      /* znam kationt */
                (
                (Sk == a1, KladnNab is(N1 + Nh), KON='ny');             /* A1 sk, ox. c. = 1 */
                (Sk == a2, KladnNab is(N1*2 +Nh), KON='naty')           /* A2 sk, ox. c. = 2 */
                ),
                ZaporNab is(-(KladnNab // N4)),                         /* slouc. je elektroneutralni */
                aniont(P2,N2,o,N3,Jmen,ZaporNab)
        );
        (       /* znam aniont */
                aniont(P2,N2,o,N3,Jmen,ZaporNab),                       /* anionty mam v DB */
                P1kon is(abs(ZaporNab*N4 + Nh) // N1),                  /* P1kon je ox.c. P1 */
                priponSt(P1kon, KON)
        )),
        /* vypis */
        write(HYDRO), write(Jmen), write(' '), write(Prvek1), write(' -'), write(KON).

vstup(P1,N1,h,Nh,P2,N2,o,N3,N4,N5,h2o) :-
	reckaPred(N5,Pred),
	write(Pred), write('hydrat '),
	vstup(P1,N1,h,Nh,P2,N2,o,N3,N4).

vstup(P1,N1,h,Nh,P2,N2,o,N3,N4,*,N5,h2o) :- vstup(P1,N1,h,Nh,P2,N2,o,N3,N4,N5,h2o).

%------------------
%POMOCNE %PREDIKATY	5 %parametry
%------------------
vycisli(Co, Jmeno, Levo, Pravo, OxidCislo) :-
	TP is (abs(Pravo * OxidCislo)),		
	L is (TP // Levo),
	nabyvaOxCisla(Jmeno,L),
	write(Co), write(' '), write(Jmeno),
	priponSt(L,Kon), write('-'), write(Kon).
