build:
	pdflatex  example-cv.tex

clean:
	rm -rf example-cv.aux  example-cv.log  example-cv.out  


thumbs:
	convert example-cv.pdf example-cv.png	
