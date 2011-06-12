%       This program is free software; you can redistribute it and/or modify
%       it under the terms of the GNU General Public License as published by
%       the Free Software Foundation; either version 2 of the License, or
%       (at your option) any later version.
%       
%       This program is distributed in the hope that it will be useful,
%       but WITHOUT ANY WARRANTY; without even the implied warranty of
%       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%       GNU General Public License for more details.
%       
%       You should have received a copy of the GNU General Public License
%       along with this program; if not, write to the Free Software
%       Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
%       MA 02110-1301, USA.       

/*	DataBase */
:- consult('./tabulka.pro').
:- consult('./parser.pro').
:- consult('./nazvy.pro').
:- consult('./kompozer.pro').
:- consult('./anionty.pro').

/*	KONTAKT S UZIVATELEM */

init :- start.
main :- start.
start :- nl,
   tab(10), write('~~-----------------~~'), nl, 
   tab(10), write(' | all C H E M I E | '), nl,
   tab(10), write('~~-----------------~~'), nl, 
   write('Moznosti uziti:'), nl,
   tab(5), write('1) Zjisteni zakladnich informaci o chem. prvcich.'), nl,
   tab(5), write('2) Urceni koncovky.'), nl,
   tab(5), write('3) Prevod vzorce na slovni vyjadreni.'), nl,
   tab(5), write('4) Doplneni vzorce o mozne prvky.'), nl,
   tab(5), write('5) Ze slovniho vyjadreni urci vzorec.'), nl,
   write('Dalsi moznosti:'), nl,
   tab(5), write('6) Informace o programu'), nl,
   tab(5), write('7) Vypsat napovedu a dalsi informace v celku.'), nl,
   write('Zadejte:'),nl,
   tab(5), write('help(N).   Zobrazi napovedu. N nahradte cislem dle moznosti vysse.'),nl,
   tab(5), write('start.     Zobrazi tuto nabidku.'), nl, 
   tab(5), write('exit.      Ukonci program.'), nl, nl,
   tab(10), write('~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~'), nl, nl.

pryc :- halt.
konec :- halt.
exit :- halt.
quit :- halt.

/* NAPOVEDA */
help :- help(7).

help(0) :- write('TIP 1: Pokud se vam vysledek nelibi, ci se zda neuplny zkuste stistknout strednik a Prolog se pokusi najit dalsi odpovidajici strukturu.'), 
		nl, nl,
		write('TIP 2: Pro zobrazeni uvodni obrazovky napiste: start.'),nl,nl.
	

help(1) :- write('# 1: Pro zakladni operace je vyuzivan predikat vstup()/1-6. Pro prvek je jeho pouziti nejjednodusi, staci zadat: vstup(<znacka daneho prvku>) a dostane se nam informaci. Napr.:'), nl, nl,
	tab(3), write('?- vstup(c).'), nl, nl,
	write(' Hledani dle jinych kriteri je take mozne. Staci k tomu pouzit predikat prvek, kde namisto kriterii, ktere nechcete napisete podtrzitko. Prvek ma nasledujici syntax:'), nl, nl,
	tab(3), write('prvek( <prot. cislo> , <znacka> , <nazev> , {kov,pol,nek} , <skupina> , <seznam oxidacnich cisel, kterych nabyva> )'), nl,nl,
	write(' kde kov - kovovy prvek, pol - polokov, nek - nekov, skupiny jsou znaceny a1-a8, b1-b,'), nl,
	write(' PS: Nejsou zahrnuty zcela vsechny prvky a ne u vsech jsou vyplnena vsechna ox. cisla.'), nl, nl.

help(2) :- write('# 2: Je pripraven predikat koncovka(N,St,Kys,Sul), kde staci nahradit jednu z promennych koncovkou ci N cislem. Napr: koncovka(N,St,Kys,natan).'), nl, nl.
 
help(3) :- write('# 3: Pro prevod slouzi predikat vstup(), kde je treba jako argumenty pouzit chemicke oznaceni slouceniny. Pro spravny chod je treba vyplnit vsechna cisla (i 1). Napr:'), nl,
	write(' vstup(h,2,o,1).'),    tab(6), write('voda'), nl,
	write(' vstup(c,1,o,2).'),    tab(6), write('oxid uhlicity'), nl,
	write(' vstup(cl,2,o,7).'),   tab(5), write('oxid chloristy'), nl,
	write(' vstup(ba,1,(oh),2).'),tab(2), write('hydroxid barnaty'), nl,
	write(' vstup(h,f).'),        tab(10), write('flurovodik'), nl,
	write(' vstup(h,2,s,1,o,4).'),tab(2), write('kyselina sirova'), nl,
	write(' vstup(h,3,p,1,o,4).'),tab(2), write('kyselina trihydrogen fosforecna'),nl,
	write(' vstup(ca,1,s,1,o,4,1,*,5,h2o'), tab(1), write('pentahydrat siranu mednateho'),nl,
	write('Nekde jsou pripraveny zkratky a lze zadat treba: vstup(h,2,o), jinde ne. Snazil jsem se dodrzovat vseobecne konvence.'),
	nl, nl.

help(4) :- write('# 4: Pro tuto moznost se vyuziva zakladni vlatnosti jazyka Prolog - backtracking. Staci tedy namisto nektereho atomu vlozit promennou, to jest jakykoliv vyraz zacinajici velkym pismenem a Prolog sam najde mozne atomy na danou pozici (lze pozadovat nalezeni i vice jak jedne promenne). Po zobrazeni odpovědi lze zadat středník a budou vyhledány další možnosti, jako v příkladu: '), nl, nl,
	write(' ?- vstup(h,2,0,N).'),nl,
	write(' voda'),nl,
	write(' N = 1 ;'),nl,
	write(' peroxid vodny'),nl,
	write(' N = 2 ;'),nl,
	write(' oxid vodny'),nl,
	write(' N = 1 ;'),nl,
	write(' false.'),nl,nl.

help(5) :- write('# 5: Pro zakladni anorganicke slouceniny jsou nadefinovany predikaty, ktere obvykle prijmaji dva parametry: prvek a koncovku. Napr. takto:'), nl,
 	write(' ?- oxid(uhlik,icity)'), tab(3), write('dostaname odpoved: c1o2 , nebo:'), nl, 
 	write(' ?- hydroxid(draslik,ny).'), tab(3), write('dostaneme odpoved: k(oh)1'), nl, nl.

help(6) :- write('INFO: Program vznikl roku 2010-2011 jako zapoctovy na cvicenich z neproceduralniho programovani na MFF UK pod vedenim Rudolfa Kryla, kteremu za to patri velke podekovani. Je vice nastinem algoritmu v Prologu pro danou ulohu, nez zcela presnym nastrojem pro urcovani vzorcu - nicmene neni problem v jeho rozvoji pokracovat. Homepage programu: http://kedrigern.github.com/allCHEMIE , program je siren zcela svobodne (GPL licence].'),nl,
	write('K vytvoreni byl pouzit OS Linux, sada nastroju GNU, textovy editor vim a nastroj pro správu verzí git. Testovan primarne v swi-Prologu: http://www.swi-prolog.org'), 
	nl, nl, write('Autor: Ondrej Profant < ondrej.profant -at- gmail.com >, http://kedrigern.github.com/allCHEMIE'), nl, nl.

help(7) :- 	member(N,[0,1,2,3,4,5,6]),
		help(N), fail.

:- start.
