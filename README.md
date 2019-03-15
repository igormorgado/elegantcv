# elegantcv

A simple and elegant Curriculum Vitae. Works nice with LaTeX and XeTeX. (haven't tried with LuaTex).

# Example

![CV0](example-cv-0.png)

![CV1](example-cv-1.png)

![CV2](example-cv-2.png)


# To use

Put the `elegantcv.cls` and `icons` dir at same dir as your curriculum. Use `example-cv.tex` as an
example.

# To build the example

```
pdflatex example-cv.tex
```

And it will build the pdf file.

# Bugs

Memoir isn't compatible with `htlatex`, need to move to article for better.


# Todo

A lot.

1. Add conditional formatting when some variables were not set (for example do not
display the phone entry if no phone is set.)

2. Adding some kind of flexibility for the contact. Displaying less or more information.

3. Be able to build CVs without the descriton (for resumes), how to do it?




