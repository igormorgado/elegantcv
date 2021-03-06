TARGET := example-cv

build:
	pdflatex  ${TARGET}.tex

html:
	make4ht -u ${TARGET}.tex

icons:
	ebb -x icons/*.png

thumbs:
	convert -background white -density 100 ${TARGET}.pdf ${TARGET}.png	

clean:
	rm -rf  ${TARGET}.aux ${TARGET}.log  ${TARGET}.out texput.log \
		${TARGET}.4ct ${TARGET}.4tc ${TARGET}.tmp ${TARGET}.xref \
		${TARGET}.dvi ${TARGET}.idv ${TARGET}.lg ${TARGET}.out.ps 

distclean: clean
	rm -rf ${TARGET}.css ${TARGET}.html ${TARGET}.pdf ${TARGET}-?.png 
