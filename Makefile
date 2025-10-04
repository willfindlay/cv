# Docker image name
IMAGE_NAME := resume-builder

# PDF targets (add more here as needed)
PDFS := cv.pdf

# Default target
.PHONY: all
all: image $(PDFS)

# Build Docker image
.PHONY: image
image:
	docker build -t $(IMAGE_NAME) .

# Pattern rule for building PDFs from .typ files
%.pdf: %.typ lib/cv-template.typ content/*.typ image
	docker run --rm -v "$(PWD):/resume" $(IMAGE_NAME) typst compile $< $@

# Clean generated files
.PHONY: clean
clean:
	rm -f $(PDFS)
