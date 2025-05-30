########################################################################
## Customizações do abnTeX2 (http://abnTeX2.googlecode.com)           ##
## para a Universidade Estadual do Ceara - UECE                       ##
##                                                                    ##
## This work may be distributed and/or modified under the             ## 
## conditions of the LaTeX Project Public License, either version 1.3 ##
## of this license or (at your option) any later version.             ##
## The latest version of this license is in                           ##
##   http://www.latex-project.org/lppl.txt                            ##
## and version 1.3 or later is part of all distributions of LaTeX     ##
## version 2005/12/01 or later.                                       ##
##                                                                    ##
## This work has the LPPL maintenance status `maintained'.            ##
##                                                                    ##
## The Current Maintainer of this work is Thiago Nascimento           ##
##                                                                    ##
## Project available on: https://github.com/thiagodnf/uecetex2        ##
##                                                                    ##
## Further information about abnTeX2                                  ##
## are available on http://abntex2.googlecode.com/                    ##
##                                                                    ##
########################################################################
filename = documento

compile:
	pdflatex -interaction=errorstopmode $(filename).tex
	biber $(filename)
	makeindex $(filename)
	makeglossaries $(filename)
	pdflatex -interaction=errorstopmode $(filename).tex
	pdflatex -interaction=errorstopmode $(filename).tex
	@echo "Processo de compilação finalizado com sucesso!"

clean:
	@echo "Limpando arquivos auxiliares..."
	@rm -f *-blx.bib *.bcf *.fls *.run.xml *.xdv *.fdb_latexmk *.aux *.alg *.acr *.dvi *.gls *.log *.bbl *.blg *.ntn *.not *.lof *.lot *.toc *.loa *.lsg *.nlo *.nls *.ilg *.ind *.ist *.glg *.glo *.xdy *.acn *.idx *.loq
	@echo "Processo finalizado com sucesso!"


all: 
	make clean
	make compile
	make clean

