sloz(A,B) :- 
	vstup(A , _ , B , _) ; 
	vstup(B , _ , A , _).

sloz(A,B,C) :-		/* 3! = 6 */
	vstup(A, _, B, _, C, _) ;
	vstup(A, _, C, _, B, _) ;
	vstup(B, _, A, _, C, _) ;
 	vstup(B, _, C, _, A, _) ;
	vstup(C, _, A, _, A, _) ;
	vstup(C, _, B, _, A, _).

sloz(A,B,C,D) :-	/* 4! = 24 */
	vstup(A ,_, B ,_, C ,_, D) ;
	vstup(A ,_, B ,_, D ,_, C) ;
        vstup(A ,_, C ,_, B ,_, D) ;
        vstup(A ,_, C ,_, D ,_, B) ;
        vstup(A ,_, D ,_, C ,_, D) ;
        vstup(A ,_, D ,_, D ,_, C) ;

        vstup(B ,_, A ,_, C ,_, D) ;
        vstup(B ,_, A ,_, D ,_, C) ;
        vstup(B ,_, C ,_, A ,_, D) ;
        vstup(B ,_, C ,_, D ,_, A) ;
        vstup(B ,_, D ,_, A ,_, C) ;
        vstup(B ,_, D ,_, C ,_, A) ;

        vstup(C ,_, A ,_, B ,_, D) ;
        vstup(C ,_, A ,_, D ,_, B) ;
        vstup(C ,_, B ,_, A ,_, D) ;
        vstup(C ,_, B ,_, D ,_, A) ;
        vstup(C ,_, D ,_, A ,_, B) ;
        vstup(C ,_, D ,_, B ,_, A) ;

 	vstup(D ,_, A ,_, B ,_, C) ;
        vstup(D ,_, A ,_, C ,_, B) ;
        vstup(D ,_, B ,_, A ,_, C) ;
        vstup(D ,_, B ,_, C ,_, A) ;
        vstup(D ,_, C ,_, A ,_, B) ;
        vstup(D ,_, C ,_, B ,_, A) .
