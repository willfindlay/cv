# William Findlay's Curriculum Vitae

## Project Overview

This is a curriculum vitae built with **Typst**, a modern markup-based typesetting system. The CV is based on a port of the popular "Awesome CV" LaTeX template, converted to Typst syntax.

**Output:** `cv.pdf` - A professionally formatted academic/technical CV

## Quick Start

### Building the CV

```bash
# Build the PDF
make

# Or build directly with typst
typst compile cv.typ cv.pdf

# Clean generated files
make clean
```

### Prerequisites

- Typst compiler installed (`typst`)
- Roboto font family (used throughout the CV)

## Project Structure

```
.
├── cv.typ                    # Main entry point
├── cv.pdf                    # Generated output
├── lib/
│   └── cv-template.typ       # Template library with all components
├── content/                  # Modular content sections
│   ├── education.typ
│   ├── skills.typ
│   ├── languages.typ
│   ├── academic-experience.typ
│   ├── other-experience.typ
│   ├── awards.typ
│   ├── talks.typ
│   ├── publications.typ
│   └── software.typ
├── william.bib               # BibTeX bibliography (for reference)
├── Makefile                  # Build system
└── LICENSE
```

## Architecture

### Main Entry Point (`cv.typ`)

The main file:
1. Imports the CV template library
2. Sets up document-level configuration (footer with date, name, page numbers)
3. Defines the header with personal information
4. Includes all content sections via `#include` directives
5. Forces pagebreak before publications section

### Template Library (`lib/cv-template.typ`)

The template defines the complete visual framework and reusable components:

**Design System:**
- **Colors:** Primary accent `#DC3522` (red/orange), sky blue `#0395DE` for links, text hierarchy from dark to light gray
- **Typography:** Roboto font family throughout
- **Layout:** US letter, custom margins (1.4cm left/right, 0.8cm top, 1cm bottom)

**Component Library:**
- `cv-setup(doc)` - Document-level setup function
- `cv-header(firstname, lastname, ...)` - Full header with name, position, contact info
- `cv-footer(left, center, right)` - Three-column footer
- `cv-section(title)` - Section headers with first 3 chars in accent color + horizontal rule
- `cv-subsection(title)` - Smaller subsection titles
- `cv-entry(title, org, location, date, description)` - Job/education entries
- `cv-honor(date, title, description, location)` - Awards/honors entries
- `cv-skill(category, skills)` - Skill category/value pairs
- `cv-items(items)` - Bullet point lists with custom styling

### Content Modules (`content/`)

Each section is a separate `.typ` file that:
1. Imports the template library: `#import "../lib/cv-template.typ": *`
2. Defines a section with `#cv-section[Title]`
3. Uses template components to structure content

**Key Sections:**
- **education.typ** - Academic degrees (PhD, Master's, Bachelor's) with GPAs and thesis links
- **skills.typ** - Technical skills organized in a table
- **languages.typ** - Programming, markup, and human languages
- **academic-experience.typ** - Research and teaching positions with detailed bullet points
- **publications.typ** - Conference proceedings and technical reports (manually formatted)
- **software.typ** - Open-source projects (creator/maintainer and contributor sections)

## Making Changes

### Adding Content

To update content, edit the appropriate file in `content/`:
- Each file is self-contained and uses template components
- All external references should use `#link()` for clickable hyperlinks
- Use `cv-items()` for bullet point lists
- Use `cv-entry()` for experience/education entries

### Modifying the Template

To change visual design or add new components:
- Edit `lib/cv-template.typ`
- Color constants are at the top (lines 8-14)
- Font definitions are at lines 20-21
- Each component is a separate function with clear parameters

### Adding New PDF Targets

To add additional documents (e.g., resume, cover letter):
1. Create a new `.typ` file (e.g., `resume.typ`)
2. Add it to the `PDFS` variable in `Makefile`: `PDFS := cv.pdf resume.pdf`
3. The pattern rule `%.pdf: %.typ` will automatically handle building

## Dependencies and Rebuilding

The Makefile tracks dependencies:
- All PDFs depend on their source `.typ` file
- All PDFs depend on `lib/cv-template.typ` (template changes trigger rebuild)
- All PDFs depend on all files in `content/` (content changes trigger rebuild)

## Bibliography

- `william.bib` contains BibTeX entries for reference
- Currently, `publications.typ` uses manual formatting rather than importing from the `.bib` file
- This keeps the publications section fully customizable for layout

## Conventions

- **Hyperlinks:** All URLs, email addresses, and external references should be clickable using `#link()`
- **Dates:** Use format "Month. Year -- Month. Year" (e.g., "Sept. 2021 -- Present")
- **Spacing:** Template handles all spacing; avoid manual `v()` or `h()` in content files unless necessary
- **Font Sizes:** Let template components handle sizing; avoid overriding in content

## Current State

As of the last analysis:
- Working directory: `/home/will/documents/resume`
- Recent changes to: `content/languages.typ`, `content/skills.typ`, `lib/cv-template.typ`, `cv.pdf`
- Git repository initialized with recent commits
