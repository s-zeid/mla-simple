# mla-simple
# Simplifies the process of writing MLA papers in LaTeX.
# Copyright (c) 2012 Scott Zeid.
# Released under the X11 License.

# This should work with normal LaTeX files, not just MLA Simple ones.

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
