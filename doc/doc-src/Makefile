
all: prog uziv specifikace
	clear
	echo "[info] Vše proběhlo v pořádku\n[info] Pro smazání nepotřebných souborů (uklid) zadejte:\n\tmake clean"

clean:
	rm -f *.out *.log *.toc *.aux

prog: programatorska-dokumentace.tex
	vlna -l -r programatorska-dokumentace.tex 	
	pdflatex programatorska-dokumentace.tex
	pdflatex programatorska-dokumentace.tex
	mv ./programatorska-dokumentace.pdf ../	

uziv: uzivatelska-prirucka.tex
	vlna -l -r uzivatelska-prirucka.tex
	pdflatex uzivatelska-prirucka.tex
	pdflatex uzivatelska-prirucka.tex
	mv ./uzivatelska-prirucka.pdf ../

specifikace: specifikace.tex
	vlna -l -r specifikace.tex
	pdflatex specifikace.tex
	pdflatex specifikace.tex
	mv ./specifikace.pdf ../
