all:
	@echo "Nothing to do by default."
	@false

.PRECIOUS: %.dvi %.pdf

%:	%.pdf
	@true

%.dvi:	clean %.tex
	latex $(@:.dvi=)
ifneq ($(realpath $(@:.dvi=.bib)),"")
	bibtex $(@:.dvi=)
	latex $(@:.dvi=)
	latex $(@:.dvi=)
endif
	$(MAKE) clean

%.pdf:	%.dvi
	dvipdf $^ $@

.PHONY: clean clean-all

clean:
	rm -f *.aux *.bbl *.blg *.log *.toc

clean-all: clean
	rm -f *.dvi *.pdf
