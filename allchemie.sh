#/bin/sh
# Spousteci skript k programu allchemie.

for x in main.pl tabulka.pl parser.pl nazvy.pl kompozer.pl ; do
	if [ ! -e $x ]; then
		echo "Chybi soubor ${x}. Naleznete ho na strance www.anilinux.org/~keddie/allchemie";
		exit;		 
	fi;
done;

if which prolog > /dev/null; then 
	prolog -q -f main.pl;
	exit;
fi;

echo "Je treba nainstalovat interpret Prologu. Budete potrebovat superuzivatelska (root) prava. Např:";
echo -e "\tDebian, Ubuntu etc.:\n\t\tapt-get install prolog";
