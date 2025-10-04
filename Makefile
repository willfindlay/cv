# Typst compiler
TYPST := typst

# PDF targets (add more here as needed)
PDFS := cv.pdf

# Default target
.PHONY: all
all: $(PDFS)

# Pattern rule for building PDFs from .typ files
%.pdf: %.typ lib/cv-template.typ content/*.typ
	$(TYPST) compile $< $@

# Clean generated files
.PHONY: clean
clean:
	rm -f $(PDFS)
