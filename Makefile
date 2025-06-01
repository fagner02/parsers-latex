filename = documento
cleancmd = @echo "Limpando arquivos auxiliares..." & rm -f *-blx.bib *.bcf *.fls *.run.xml *.xdv *.fdb_latexmk *.aux *.alg *.acr *.dvi *.gls *.log *.bbl *.blg *.ntn *.not *.lof *.lot *.toc *.loa *.lsg *.nlo *.nls *.ilg *.ind *.ist *.glg *.glo *.xdy *.acn *.idx *.loq & echo "Processo finalizado com sucesso!"
pdflatex = pdflatex -file-line-error -halt-on-error -interaction=errorstopmode -synctex=1 $(filename).tex
all: clean compile postclean

compile:
	$(pdflatex)
	biber $(filename)
	makeindex $(filename)
	makeglossaries $(filename)
	$(pdflatex)
	$(pdflatex)
	@echo "Processo de compilação finalizado com sucesso!"

biber:
	biber $(filename)
	makeindex $(filename)
	makeglossaries $(filename)

pdf:
	$(pdflatex)

clean:
	$(cleancmd)

postclean:
	$(cleancmd)

