PDFLATEX = pdflatex -halt-on-error -file-line-error
BIBTEX = bibtex
TEXFILES = example.tex 
all: main
main:
	$(PDFLATEX) $@
	-$(BIBTEX) $@
	$(PDFLATEX) $@
	$(PDFLATEX) $@

clean:
	rm -f *.aux *.bbl *.blg *.dvi *.log *.out *.toc *.ps *.synctex.gz *.mtc* *.maf

arxiv.tar: cv.pdf $(TEXFILES)
	tar chvf arxiv.tar $(TEXFILES) main.bbl $$(grep includegraphic $(TEXFILES) | egrep -o '\{.*\}' | sed 's/{//' | sed 's/}//')
