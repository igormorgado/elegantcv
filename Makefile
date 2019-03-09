build:
	pdflatex  example-cv.tex

clean:
	rm -rf example-cv.aux  example-cv.log  example-cv.out  *.png

thumbs:
	convert -background white -density 150 example-cv.pdf example-cv.png	
