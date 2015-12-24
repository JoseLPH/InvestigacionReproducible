#
# Build a PDF with all the notebooks 
#
#TEMPLATE=chapter
NOTEBOOKS=introduccion.ipynb \
          otros_lenguajes.ipynb \
          ejercicio_dados.ipynb

LATEXFILES=$(NOTEBOOKS:.ipynb=.tex)

CLEANFILES=$(.aux=.tex=.out=.log=.pdf)

#.ipynb.tex:
#	ipython nbconvert --to latex --template $(TEMPLATE) $<
#    ipython nbconvert --to latex $<

#all: $(LATEXFILES) buildpdf
all: latexfiles buildpdf

latexfiles:
	ipython nbconvert --to latex introduccion.ipynb
	ipython nbconvert --to latex otros_lenguajes.ipynb
	ipython nbconvert --to latex ejercicio_dados.ipynb
	

buildpdf: latexfiles
	pdflatex introduccion.tex
	pdflatex otros_lenguajes.tex
	pdflatex ejercicio_dados.tex
	pdfjoin introduccion.pdf otros_lenguajes.pdf ejercicio_dados.pdf 
	evince ejercicio_dados-joined.pdf
	
clean:
	rm *.aux
	rm *.tex
	rm *.out
	rm *.log
	rm *.pdf
