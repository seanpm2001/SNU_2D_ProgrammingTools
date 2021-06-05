#################################################
# Makefile for LaTeX/Linux
#
# Author: Petter Kallstrom (petterk es.isy.liu.se)
#
# Handles SVG, EPS and PDF image formats for compilation into PDFs or DVIs
# Handles one bibliography file
#
# Tested with CentOS, GNU Make 3.81, /bin/sh 3.2.25, /usr/bin/[ 5.97, (pdf)latex 3.1415926-1.40.10-2.2, inkscape 0.47 r22583.
#++++++++++++++++++++++++++++++++++++++++++++++++
#
# Set up this Makefile:
#   Place all image files in a subdirectory.
#   Update all variables in the first section below.
#
# Use this Makefile:
#   Run "make help", or see end of file.
#
# Description of file:
#  Keep the images in lists, one list per format.
#  When compiling into for instance a .dvi file, the target.dvi rule is used.
#    Bibtex and convertion between .eps and .pdf images are handled within this rule.
#    (I found no way to generate multiple rules from a list)
#  Converting from .svg files into .eps or .pdf files are done in their own rules.
#  Some make/shell help is written in the end of this file.
# 
#################################################

# Image sources: Only include the original files (not files created by this script).
SVGs=drawing1 drawing2 # excluding .svg
EPSs=graph1 graph2 # excluding .eps
PDFs=logo # excluding .pdf
OTHERS=img1.png img1.eps # files without conversion support from this script. Include file extension.
IMG=img # path to images, excluding trailing "/"

# Latex top file (excl .tex):
NAME=main # excl .tex
# When to run bibtex. 0=never, 1=if .bib was changed, 2=always. see help
RUNBIB=1
# Bibliography file name, used only for dependencis:
BNAME=bibliography.bib # including .bib
# Spam filter for latex outputs
FilterLatex=egrep -v "/sw/|Babel|german|bulgarian|estonia|hungarian|latvia|romanian|swedish|entering|LaTeX2e|Transcript|Document Class|For additional"

# ===== Fix leading and trailing spaces from critical variables (do not change this). =====
IMG:=$(strip $(IMG))
NAME:=$(strip $(NAME))

#============== PHONY COMMANDS (except help) ================
.PHONY : dvi dvipdf kdvi dviacro pdf acro bib clean help
default : help
dvi : $(NAME).dvi
dvipdf : $(NAME).dvi.pdf
kdvi : $(NAME).dvi; /bin/tcsh -c 'kdvi $(NAME).dvi' &  #by doing like this, KDVI will auto reload when DVI was changed
dviacro : $(NAME).dvi.pdf; acroread $(NAME).dvi.pdf &
pdf : $(NAME).pdf
acro : $(NAME).pdf; acroread $(NAME).pdf &
bib : $(NAME).bbl
clean : ; rm -f *~ *aux *backup *log *toc *bbl *blg *lot *lof
superclean : clean
	rm -f $(NAME).pdf $(NAME).dvi $(NAME).dvi.pdf
	rm -f $(SVG2PDF) $(foreach x,$(EPSs),$(IMG)/$(x).pdf) # remove generated pdf images
	rm -f $(SVG2EPS) $(foreach x,$(PDFs),$(IMG)/$(x).eps) # remove generated eps files

#============== STRING MANIPULATIONS ================
SVG2PDF=$(foreach x,$(SVGs),$(IMG)/$(x).pdf) # "img/svg1.pdf img/svg2.pdf ", if SVGs="svg1 svg2"
SVG2EPS=$(foreach x,$(SVGs),$(IMG)/$(x).eps) # "img/svg1.eps img/svg2.eps ", if SVGs="svg1 svg2"
PDF2=$(foreach x,$(PDFs),$(IMG)/$(x).pdf)    # "img/pdf1.pdf img/pdf2.pdf ", if PDFs="pdf1 pdf2"
EPS2=$(foreach x,$(EPSs),$(IMG)/$(x).eps)    # "img/eps1.pdf img/eps2.pdf ", if EPSs="eps1 eps2"

#============== COMPILATIONS / CONVERSIONS ================

# ===== SVG Images =====
%.eps : %.svg
	@echo "======= Converting SVG to EPS: $< ======="
	@inkscape --without-gui --file=$< --export-eps=$@ #--export-text-to-path

%.pdf : %.svg
	@echo "======= Converting SVG to PDF: $< ======="
	@inkscape --without-gui --file=$< --export-pdf=$@ #--export-text-to-path

# ===== .tex -> .dvi =====
$(NAME).dvi : $(NAME).tex $(BNAME) $(EPS2) $(PDF2) $(SVG2EPS) $(OTHERS)
  ifneq ($(strip $(PDFs)),) # convert pdf->eps.
  # Generate own "rules" for eps dependencies of the pdf files in list PDFs
	@for x in $(PDFs) ; do \
	  if [ $(IMG)/$${x}.pdf -nt $(IMG)/$${x}.eps ] ; then \
	    echo "======= Converting PDF to EPS: $(strip $(IMG))/$${x}.pdf ======="; \
	    pdf2ps $(IMG)/$${x}.pdf /dev/stdout | ps2eps > $(IMG)/$${x}.eps; \
	  fi; \
	done
  endif
  ifneq ($(RUNBIB), 0)
	@if [ $(RUNBIB) -eq 2 -o $(BNAME) -nt $(NAME).bbl ] ; then \
	  @if [ $(NAME).tex -nt $(NAME).log ] ; then \
	    echo "======= Running LaTeX (for bibtex purpose) =======" ;\
	    latex $(NAME).tex | $(FilterLatex) ;\
	  fi; \
	  echo "======= Running BibTeX =======" ;\
	  bibtex $(NAME) ; \
	fi
  endif
	@echo "======= Running LaTeX ======="
	@while (latex $(NAME).tex | $(FilterLatex) ; grep -q "Rerun to get" $(NAME).log ) do echo "======= Rerunning LaTeX =======" ; done

# ===== .dvi -> .pdf =====
$(NAME).dvi.pdf : $(NAME).dvi
	@echo "======= Converting DVI to PDF ======="
	@dvipdf $(NAME).dvi $(NAME).dvi.pdf

# ===== .tex -> .pdf =====
$(NAME).pdf : $(NAME).tex $(BNAME) $(EPS2) $(PDF2) $(SVG2PDF) $(OTHERS)
  ifneq ($(strip $(EPSs)),) # convert eps->pdf
  # Generate own "rules" for pdf dependencies of the eps files in list EPSs
	@for x in $(EPSs) ; do \
	  if [ $(IMG)/$${x}.eps -nt $(IMG)/$${x}.pdf ] ; then \
	    echo "======= Converting EPS to PDF: $(strip $(IMG))/$${x}.eps ======="; \
	    epstopdf $(IMG)/$${x}.eps ;\
	  fi; \
	done
  endif
  ifneq ($(RUNBIB), 0)
	@if [ $(RUNBIB) -eq 2 -o $(BNAME) -nt $(NAME).bbl ] ; then \
	  @if [ $(NAME).tex -nt $(NAME).log ] ; then \
	    echo "======= Running pdfLaTeX (for bibtex purpose) =======" ;\
	    pdflatex $(NAME).tex | $(FilterLatex) ;\
	  fi; \
	  echo "======= Running BibTeX =======" ;\
	  bibtex $(NAME) ; \
	fi
  endif
	@echo "======= Running PDFLaTeX ======="
	@while (pdflatex $(NAME).tex | $(FilterLatex) ; grep -q "Rerun to get" $(NAME).log ) do echo "======= Rerunning PDFLaTeX =======" ; done

# ===== The bibliography, as a stand-alone command (this is not called normally) =====
$(NAME).bbl : $(NAME).tex $(BNAME)
	@echo "======= Runnin BibTeX ======="
	@bibtex $(NAME)

#============== PHONY HELP ================
help:
	@echo ""
	@echo "make <cmd> [NAME=<main name>] [RUNBIB=0/1/2]"
	@echo ""
	@echo " <cmd>:"
	@echo "    dvi     - latex: .tex -> .dvi."
	@echo "    dvipdf  - latex + dvipdf: .tex -> .dvi -> .dvi.pdf."
	@echo "    kdvi    - latex + kdvi: .tex -> .dvi, view in KDVI."
	@echo "    dviacro - latex + dvipdf + acroread: .tex -> .dvi -> .dvi.pdf, view in acroread."
	@echo "    pdf     - pdflatex: .tex -> pdf."
	@echo "    acro    - pdflatex + acroread: .tex -> .pdf, view in acroread."
	@echo "    bib     - bibtex: .aux,.bib -> .bbl (independent of RUNBIB)."
	@echo "    clean   - rm *~ *aux *backup *log *toc *bbl *blg *lot *lof."
	@echo "    superclean - clean + rm generated images and dvi/pdf files"
	@echo "    help    - show this message. This is default, if no <cmd> are given."
	@echo ""
	@echo " NAME: optional name of main latex file (excl. \".tex\"). Actual=$(NAME)."
	@echo ""
	@echo " RUNBIB: Decide whether to update the bibliography file or not. Actual=$(RUNBIB)."
	@echo "       =0: Never run bibtex (more then by the bib command)."
	@echo "       =1: Run bibtex if .bib was changed, or .bbl is missing."
	@echo "       =2: Run bibtex every time."
	@echo ""
	@echo " Example (without bibtex): make dviacro NAME=report"
	@echo "  -> latex report.tex; dvipdf report.dvi report.dvi.pdf; acroread report.dvi.pdf"
	@echo " Example (with bibtex): make dviacro NAME=report"
	@echo "  -> latex report.tex; bibtex report; latex report.tex; latex report.tex; dvipdf report.dvi report.dvi.pdf; acroread report.dvi.pdf"
	@echo ""
	@echo " PS. .tex->.dvi can only handle .eps files."
	@echo "     .tex->.pdf can NOT handle .eps files, but e.g. PDF/PNG files."
	@echo "     This makefile will automatically convert from svg images to eps or pdf formats."
	@echo "     This makefile will automatically convert from pdf images to eps formats."
	@echo "     This makefile will automatically convert from eps images to pdf formats."
	@echo "     This makefile has no support for other image formats (which does not mean they cannot be used)."
	@echo ""

# Some shell command syntax (see "man sh", "man test"):
# > for VAR in LIST ; do COMMANDS; done
# > if [ ... ]; then COMMANDS; fi
# > ...: -o = logical OR, -eq = numerical equal, -e = exist, ! = not, -nt = newer than.
#        "A -nt B" = true if file A is newer than file B, or if (only) file B is missing.
#        "A -nt B" = false if file B is not older than file A, or if file A is missing.
#
# The complete make manual: http://www.gnu.org/software/make/manual/

