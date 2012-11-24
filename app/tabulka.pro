%#       This program is free software; you can redistribute it and/or modify
%#       it under the terms of the GNU General Public License as published by
%#       the Free Software Foundation; either version 2 of the License, or
%#       (at your option) any later version.
%#       
%#       This program is distributed in the hope that it will be useful,
%#       but WITHOUT ANY WARRANTY; without even the implied warranty of
%#       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%#       GNU General Public License for more details.
%#       
%#       You should have received a copy of the GNU General Public License
%#       along with this program; if not, write to the Free Software
%#       Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
%#       MA 02110-1301, USA.
%#       

/* 
PREDIKATY obsazene v tomto souboru:
	prvek( <prot. cislo> , <znacka> , <nazev> , {kov,pol,nek} , <skupina> , <sez. oxid. cis.> ).
	koncovky (klasicke)
	predpony
	vypisPrvek(X).
	nabyvaOxCisla(Prvek,N).
*/

prvek(1 , h , vodik   , nek, a1, [1]).
prvek(2 , he, helium  , nek, a8, []).
prvek(3 , li, lithium , kov, a1, [1]).
prvek(4 , be, berylium, kov, a2, [2]).
prvek(5 , b , bor     , pol, a3, [3]).
prvek(6 , c , uhlik   , nek, a4, [2,4]).
prvek(7 , n , dusik   , nek, a5, [1,2,3,4,5]).
prvek(8 , o , kyslik  , nek, a6, [1,2]).
prvek(9 , f , fluor   , nek, a7, [1]).
prvek(10, ne, neon    , nek, a8, []).
prvek(11, na, sodik   , kov, a1, [1]).
prvek(12, mg, horcik  , kov, a2, [2]).
prvek(13, al, hlinik  , pol, a3, [3]).
prvek(14, si, kremik  , pol, a4, [4]).
prvek(15, p , fosfor  , nek, a5, [3,5]).
prvek(16, s , sira    , nek, a6, [2,4,6]).
prvek(17, cl, chlor   , nek, a7, [1,3,5,7]).
prvek(18, ar, argon   , nek, a8, []).
prvek(19, k , draslik , kov, a1, [1]).
prvek(20, ca, vapnik  , kov, a2, [2]).
prvek(21, sc, skandium, kov, b3, [3]).
prvek(22, ti, titan   , kov, b4, [3,4]).
prvek(23, v , vanad   , kov, b5, [2,3,4,5]).
prvek(24, cr, chrom   , kov, b6, [2,3,6]).
prvek(25, mn, mangan  , kov, b7, [2,3,4,6,7]).
prvek(26, fe, zelezo  , kov, b8, [2,3,6]).
prvek(27, co, kobalt  , kov, b8, [2,3]).
prvek(28, ni, nikl    , kov, b8, [2,3]).
prvek(29, cu, med     , kov, b1, [1,2]).
prvek(30, zn, zinek   , kov, b2, [2] ).
prvek(31, ga, galium  , kov, a3, [3]).
prvek(32, ge, germanium,pol, a4, [4]).
prvek(33, as, arsen   , pol, a5, [2,3,5]).
prvek(34, se, selen   , nek, a6, [2,4,5]).
prvek(35, br, brom    , nek, a7, [1,3,5,7]).
prvek(36, kr, krypton , nek, a8, []).
prvek(37, rb, rubidium, kov, a1, [1]).
prvek(38, sr, stroncium,kov, a2, [2]).
prvek(42, mo, molybden, kov, b6, [2,3,4,5,6]).
prvek(46, pd, palladium,kov, b8, [2,4]).
prvek(47, ag, stribro , kov, b1, [1,2]).
prvek(48, cd, kadmium , kov, b2, [2]).
prvek(49, in, indium  , kov, a3, [3]).
prvek(50, sn, cin     , kov, a4, [2,4]).
prvek(51, sb, antimon , pol, a5, [3,5]).
prvek(52, te, telur   , pol, a6, [2,4,6]).
prvek(53, i , jod     , nek, a7, [1,5,7]).
prvek(55, cs, cesium  , kov, a1, [1]).
prvek(56, ba, baryum  , kov, a2, [2]).
prvek(73, ta, tantal  , kov, b5, [5]).
prvek(74, w , wolfram , kov, b6, [2,3,4,5,6]).
prvek(76, os, osmium  , kov, b8, [2,3,4,6,8]).
prvek(77, ir, iridium , kov, b8, [1,2,3,4,6]).
prvek(78, pt, platina , kov, b3, [2, 4]).
prvek(79, au, zlato   , kov, b2, [1,3]).
prvek(80, hg, rtut    , kov, b3, [1,2]).
prvek(81, tl, thalium , kov, a3, [1,3]).
prvek(82, pb, olovo   , kov, a4, [2,4]).
prvek(83, bi, bismut  , kov, a5, [3,5]).
prvek(84, po, polonium, kov, a6, [2,4,6]).
prvek(85, at, astat   , pol, a7, [1,3,5,7]).
prvek(86, rn, radon   , nek, a8, []).
prvek(87, fr, francium, kov, a1, [1]).
prvek(88, ra, radium  , kov, a2, [2]).

/* KONCOVKY a PREDPONY */
koncovka(N , X, Y, Z) :-
	priponSt( N , X ),
	priponKys( N, Y ),
	priponSul( N, Z ).

priponSt( 1 , ny ).
priponSt( 2 , naty ).
priponSt( 3 , ity ).
priponSt( 4 , icity ).
priponSt( 5 , icny ).
priponSt( 5 , ecny ).
priponSt( 6 , ovy  ).    
priponSt( 7 , isty ).
priponSt( 8 , icely).

priponKys( 1, na).
priponKys( 2, nata).
priponKys( 3, ita).
priponKys( 4, icita).
priponKys( 5, icna).
priponKys( 5, ecna).
priponKys( 6, ova).
priponKys( 7, ista).
priponKys( 8, icela).

priponSul(1, nan).
priponSul(2, natan).
priponSul(3, itan).
priponSul(4, icitan).
priponSul(5, icnan).
priponSul(5, ecnan).
priponSul(6, an).
priponSul(7, istan).
priponSul(8, icelan).

reckaPred( 0 , '').
reckaPred( 1 , mono).
reckaPred( 2 , di).
reckaPred( 3 , tri).
reckaPred( 4 , tetra).
reckaPred( 5 , penta).
reckaPred( 6 , hexa).
reckaPred( 7 , hepta).
reckaPred( 8 , okta).
reckaPred( 9 , nona).
reckaPred(10 , deka).
reckaPred(11 , un).
reckaPred(12 , do).


/* VYPSANI PRVKU */
vypisPrvek(X) :-
    prvek( _ , X , Jmeno , KN, Skupina, OxidCisla ),
    write(Jmeno),
    (
        (KN == kov, write(' je kov, prvek '))      ;
        (KN == nek, write(' je nekovovy prvek '))  ;
        (KN == pol, write(' je polokov, prvek '))
    ),
    (
        (Skupina == a1, write('prvni A skupiny.')) ;
        (Skupina == a2, write('druhe A skupiny.')) ;
        (Skupina == a3, write('treti A skupiny.')) ;
        (Skupina == a4, write('ctrte A skupiny'))  ;
        (Skupina == a5, write('pate A skupiny'))   ;
        (Skupina == a6, write('seste A skupiny'))  ;
        (Skupina == a7, write('sedme A skupiny'))  ;
        (Skupina == a8, write('osme A skupiny'))   ;
	(write('B skupiny'))
    ), nl ,
    write('Orientacne nabyva oxid. cisel: '),
    vypisSeznam(OxidCisla),
    write('(nejsou zahrnuty zaporne).'), nl.

/* POMOCNE PREDIKATY */
vypisSeznam([]).
vypisSeznam([H|T]) :-
        write(H),
        write(', '),
        vypisSeznam(T).


nabyvaOxCisla(Prvek,N) :-
        (
		prvek(_, _ , Prvek, _, _, Sez);
		prvek(_, Prvek , _, _, _, Sez)
	),
        member(N, Sez).
