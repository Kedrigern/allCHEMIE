%% zakladni anionty 
%% aniont( prvek, četnost, kyslik, četnost, název, celkem)

%% vizuálni podpora (sir-icitan): 
%%   iv -ii
%%  s  o
%%   1 	 3
aniont(s ,1 ,o, 3,siricitan,-2).   
aniont(s ,1 ,o, 4,siran,-2).
aniont(c ,1 ,o, 3,uhlicitan,-2).
aniont(p ,1 ,o, 4,fosforecnan,-3).
aniont(n ,1 ,o, 2,dusitan,-1).
aniont(n ,1 ,o, 3,dusicnan,-1).
aniont(mn,1 ,o, 4,manganistan,-1).
aniont(cr,1 ,o, 4,chroman,-2).
aniont(cr,2 ,o, 4,dichroman,-2).
aniont(se,1 ,o, 4,selenan,-2).
aniont(cl,1 ,o, 4,chloristan,-1).
aniont(te,1 ,o, 3,teluricitan,-2).
aniont(cl,1 ,o, 1,chlornan,-1).
aniont(cl,1 ,o, 1,chlorecnan,-1).
aniont(P1,N1,o,N2,Jmeno,OxC) :-                                         /* Obecny, atomy, vyskyty a celkove ox. c. */
        PrvOxC is((2*N2 + OxC)//N1),                                    /* ox. cislo prvku */
        prvek(_,P1,Jm,_,_,_),
        nabyvaOxCisla(P1,PrvOxC),
        priponSul(PrvOxC,Konc),
        string_concat(Jm,Konc,Jmeno).


