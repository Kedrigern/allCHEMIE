#/bin/sh
# Spousteci skript k programu allchemie.

cd app;
for x in main.pro tabulka.pro parser.pro nazvy.pro kompozer.pro ; do
	if [ ! -e $x ]; then
		echo "Chybi soubor ${x}. Naleznete ho na strance https://github.com/Kedrigern/allCHEMIE";
		exit;		 
	fi;
done;
cd ..

if which prolog > /dev/null; then 
	prolog -q -f main.pro;
	exit;
fi;

echo "Je treba nainstalovat interpret Prologu. Budete potrebovat superuzivatelska (root) prava. Např:";
echo -e "\tDebian, Ubuntu etc.:\n\t\tapt-get install swi-prolog";
