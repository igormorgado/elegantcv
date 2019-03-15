TARGET := example-cv

build:
	pdflatex  ${TARGET}.tex

html:
	htlatex ${TARGET}.tex

thumbs:
	convert -background white -density 100 ${TARGET}.pdf ${TARGET}.png	

clean:
	rm -rf ${TARGET}.aux ${TARGET}.log  ${TARGET}.out  ${TARGET}-?.png ${TARGET}.4ct ${TARGET}.4tc ${TARGET}.tmp ${TARGET}.xref *conflicted*

