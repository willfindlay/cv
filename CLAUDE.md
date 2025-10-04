# William Findlay's Curriculum Vitae

## Project Overview

This is a curriculum vitae built with **Typst**, a modern markup-based typesetting system. The CV is based on a port of the popular "Awesome CV" LaTeX template, converted to Typst syntax.

**Output:** `cv.pdf` - A professionally formatted 4-page academic/technical CV

## Quick Start

### Building the CV

```bash
# Build using Docker (recommended - ensures consistent fonts)
make

# Clean generated files
make clean
```

### Prerequisites

**Docker-based build (recommended):**
- Docker installed and running
- No local Typst or font installation needed

**Native build (optional):**
- Typst compiler installed (`typst`)
- Roboto font family installed system-wide
- Note: Native builds may have font warnings if Roboto isn't properly configured

## Project Structure

```
.
├── cv.typ                    # Main entry point
├── cv.pdf                    # Generated output (4 pages)
├── Dockerfile                # Docker build environment with Typst + Roboto fonts
├── .dockerignore             # Docker build context exclusions
├── Makefile                  # Docker-based build system
├── lib/
│   └── cv-template.typ       # Template library with all components
├── content/                  # Modular content sections
│   ├── education.typ         # Academic degrees (PhD, MS, BS)
│   ├── skills.typ            # Technical skills table
│   ├── languages.typ         # Programming/markup/human languages
│   ├── academic-experience.typ  # Research & teaching positions
│   ├── other-experience.typ  # Non-academic work
│   ├── awards.typ            # Honors and awards
│   ├── talks.typ             # Conference presentations
│   ├── publications.typ      # Papers and technical reports
│   └── software.typ          # Open-source contributions
├── william.bib               # BibTeX bibliography (for reference)
└── LICENSE
```

## Architecture

### Build System (`Dockerfile`, `Makefile`)

**Docker Container:**
- Base: Ubuntu 24.04
- Typst version: 0.12.0 (musl build for portability)
- Fonts: Roboto family with fontconfig properly configured
- Build cache optimized for fast rebuilds

**Makefile Flow:**
1. `make image` - Builds Docker image with Typst and fonts
2. `make all` (default) - Builds image, then compiles CV using container
3. Pattern rule `%.pdf: %.typ` - Volume mounts project directory for compilation
4. `make clean` - Removes generated PDFs

### Main Entry Point (`cv.typ`)

The main file orchestrates document compilation:
1. Imports template library: `#import "lib/cv-template.typ": *`
2. Sets up document with `cv-setup.with(footer: ...)` show rule
3. Creates dynamic footer displaying: current date, name + "Curriculum Vitae", page number
4. Defines header via `cv-header()` with personal info and social links
5. Includes content sections via `#include "content/*.typ"`
6. Forces `#pagebreak()` before publications section

### Template Library (`lib/cv-template.typ`)

The template defines the complete visual framework and reusable components.

**Design System:**
- **Colors:**
  - Primary accent: `#DC3522` (red/orange)
  - Links: `#0395DE` (sky blue)
  - Text hierarchy: `color-darktext` → `color-text` → `color-graytext` → `color-lighttext`
- **Typography:** Roboto font family throughout (header and body)
- **Layout:** US letter, custom margins (1.4cm left/right, 0.8cm top, 1cm bottom)

**Component Library:**

| Component | Purpose | Location |
|-----------|---------|----------|
| `cv-setup(doc)` | Document-level setup with page config, font, link styling | `lib/cv-template.typ:338` |
| `cv-header(firstname, lastname, ...)` | Header with name, position, contact (☎, ✉, ⌂, ■) | `lib/cv-template.typ:35` |
| `cv-footer(left, center, right)` | Three-column footer with small caps | `lib/cv-template.typ:116` |
| `cv-section(title)` | Section headers (first 3 chars in accent) + horizontal rule | `lib/cv-template.typ:139` |
| `cv-subsection(title)` | Smaller subsection titles | `lib/cv-template.typ:184` |
| `cv-entry(title, org, location, date, description)` | Job/education entries with two-row header | `lib/cv-template.typ:199` |
| `cv-honor(date, title, description, location)` | Awards/honors tuple for table display | `lib/cv-template.typ:269` |
| `cv-skill(category, skills)` | Skill category/value pairs for table display | `lib/cv-template.typ:299` |
| `cv-items(items)` | Bullet point lists with custom spacing | `lib/cv-template.typ:321` |

**Key Implementation Details:**
- Section headers extract first 3 characters for accent coloring using string slicing
- All components return tuples for table-based layouts (skills, honors)
- Link styling applied globally via `show link:` rule in `cv-setup`
- Footer uses `place(bottom)` with context for dynamic page numbers

### Content Modules (`content/`)

Each section is a separate `.typ` file following this pattern:
1. Import template: `#import "../lib/cv-template.typ": *`
2. Define section: `#cv-section[Title]`
3. Use template components to structure content
4. All external references use `#link()` for clickable hyperlinks

**Content Organization:**

| File | Purpose | Components Used |
|------|---------|----------------|
| `education.typ` | 3 degrees (PhD ongoing, MS, BS) with GPAs, thesis links | `cv-entry`, `cv-items` |
| `skills.typ` | Technical skills in 4 categories | `#table`, `cv-skill` |
| `languages.typ` | Programming/markup/human languages | `#table`, `cv-skill` |
| `academic-experience.typ` | Research assistant, teaching positions | `cv-entry`, `cv-items`, nested `#list` |
| `other-experience.typ` | Non-academic work | `cv-entry`, `cv-items` |
| `awards.typ` | Honors and recognitions | `#table`, `cv-honor` |
| `talks.typ` | Conference presentations | TBD format |
| `publications.typ` | Papers (manual bibliography formatting) | `cv-subsection`, manual paragraph styling |
| `software.typ` | Open-source projects (creator + contributor) | `cv-subsection`, `cv-entry`, `cv-items` |

**Special Formatting in `publications.typ`:**
- Manual bibliography formatting (not using `william.bib` import)
- Custom paragraph settings: `#set par(hanging-indent: 1em, justify: true)`
- Direct text size/font overrides for bibliography style
- Citation numbers in escaped brackets: `\[1\]`

## Making Changes

### Adding or Updating Content

**To update existing sections:**
1. Edit the appropriate file in `content/`
2. Each file is self-contained
3. Run `make` to rebuild the PDF

**Common patterns:**
```typst
// Adding a new job/education entry
#cv-entry(
  [Position Title],
  [Organization Name],
  [Location],
  [Start Date -- End Date],
  description: cv-items(
    (
      [Bullet point 1],
      [Bullet point 2 with #link("https://example.com")[hyperlink]],
    )
  )
)

// Adding a skill category
..cv-skill([Category Name], [Skill 1, Skill 2, Skill 3]),

// Nested bullet points (for sub-items)
[Main bullet point
  #list(
    indent: 2em,
    body-indent: 0.5em,
    [Sub-item 1],
    [Sub-item 2],
  )
],
```

### Modifying Visual Design

**Color scheme** (`lib/cv-template.typ:8-14`):
```typst
#let color-awesome = rgb("#DC3522")        // Primary accent
#let color-awesome-skyblue = rgb("#0395DE") // Links
#let color-darktext = rgb("#414141")       // Headers
#let color-text = rgb("#333333")           // Body text
#let color-graytext = rgb("#5D5D5D")       // Secondary text
#let color-lighttext = rgb("#999999")      // Tertiary text
```

**Fonts** (`lib/cv-template.typ:20-21`):
```typst
#let font-header = "Roboto"
#let font-body = "Roboto"
```

**Layout** (`lib/cv-template.typ:344-346`):
```typst
set page(
  paper: "us-letter",
  margin: (left: 1.4cm, top: 0.8cm, right: 1.4cm, bottom: 1cm),
)
```

### Adding New PDF Targets

To create additional documents (e.g., resume, cover letter):

1. Create new `.typ` file (e.g., `resume.typ`)
2. Update `Makefile`:
   ```makefile
   PDFS := cv.pdf resume.pdf
   ```
3. The pattern rule automatically handles building
4. Run `make` to build all targets

### Extending the Template

**To add a new component:**
1. Add function to `lib/cv-template.typ`
2. Follow existing naming convention: `cv-*`
3. Return styled content or tuple for table usage
4. Document parameters in function signature

**Example:**
```typst
#let cv-certification(date, title, issuer) = {
  grid(
    columns: (auto, 1fr, auto),
    align: (left, left, right),
    text(size: 9pt, fill: color-graytext, date),
    text(size: 9pt, weight: "bold", fill: color-darktext, title),
    text(size: 9pt, style: "italic", fill: color-awesome, issuer)
  )
}
```

## Dependencies and Rebuilding

**Makefile dependency tracking:**
```makefile
%.pdf: %.typ lib/cv-template.typ content/*.typ image
```

This means:
- Changes to any `.typ` file in `content/` trigger rebuild
- Changes to `lib/cv-template.typ` trigger rebuild
- Docker image rebuild triggered by `Dockerfile` changes
- Pattern rule handles any new `.typ` files automatically

**Rebuild triggers:**
- Content updates → `make` (fast, ~1-2 seconds)
- Template changes → `make clean && make`
- Dockerfile changes → Image rebuilt automatically
- Font/dependency changes → `docker build --no-cache -t resume-builder .`

## Bibliography Management

**Current approach:**
- `william.bib` contains BibTeX entries for reference
- `publications.typ` uses **manual formatting** (not automatic import)
- Allows full control over citation style and layout

**To add a publication:**
1. Add BibTeX entry to `william.bib` (for reference)
2. Manually format citation in `publications.typ`
3. Follow existing pattern with hanging indent and DOI/URL links

**Example citation format:**
```typst
\[1\] Author1, Author2, and Author3. "Paper Title". In: _Conference/Journal Name_.
Series. Location: Publisher, Year, pp. X–Y. #link("https://doi.org/...")[DOI: ...].
```

## Conventions and Style Guide

**Hyperlinks:**
- All URLs, emails, GitHub links use `#link()`
- Phone: `link("tel:" + mobile, "☎ " + mobile)`
- Email: `link("mailto:" + email, "✉ " + email)`
- Web: `link("https://" + homepage, "⌂ " + homepage)`

**Date formatting:**
- Use format: `Month. Year -- Month. Year`
- Examples: `Sept. 2021 -- Present`, `Apr. 2019 -- Aug. 2020`
- Ongoing positions: Use `Present`

**Spacing:**
- Let template components handle spacing
- Avoid manual `v()` or `h()` except for special cases
- Use `#h(4em)` in `languages.typ:11` for category alignment

**Font sizes:**
- Let components determine sizing
- Override only in special cases like `publications.typ`
- Template defines: 32pt (name), 16pt (sections), 10pt (entries), 9pt (body), 8pt (dates)

**Text emphasis:**
- Bold: Position titles, organization names, publication titles
- Italic: Locations, dates, journal/conference names
- Small caps: Position subtitles, footer text

## Docker Container Details

**Image layers:**
1. Ubuntu 24.04 base
2. Install: curl, xz-utils, fonts-roboto, fontconfig
3. Download and extract Typst 0.12.0
4. Run `fc-cache -fv` to index fonts
5. Set working directory to `/resume`
6. Copy project files (filtered by `.dockerignore`)

**Volume mounting:**
- Container mounts: `$(PWD):/resume`
- Allows output files to persist on host
- CV owner/permissions: may be `root:root` (Docker user)

**Font verification:**
```bash
# Check fonts available in container
docker run --rm resume-builder typst fonts | grep -i roboto
# Output: Roboto (no warnings)
```

**Container optimization:**
- `.dockerignore` excludes: `.git`, `*.pdf`, `.serena`, `README.md`
- Reduces build context size
- Prevents copying build artifacts into image

## Development Workflow

**Typical content update:**
```bash
# 1. Edit content file
vim content/education.typ

# 2. Rebuild
make

# 3. Review PDF
# (Open cv.pdf in PDF viewer)

# 4. Commit changes
git add content/education.typ cv.pdf
git commit -m "Update education section"
```

**Updating Docker environment:**
```bash
# Change Typst version or add dependencies
vim Dockerfile

# Force rebuild without cache
docker build --no-cache -t resume-builder .

# Test compilation
make clean && make
```

**Testing template changes:**
```bash
# Edit template
vim lib/cv-template.typ

# Clean build (ensures no stale artifacts)
make clean && make

# Check all 4 pages render correctly
```

## Troubleshooting

**Font warnings:**
- Problem: `warning: unknown font family: roboto`
- Solution: Use Docker build (`make`) instead of native Typst
- Root cause: Roboto fonts not installed or not indexed by fontconfig

**Permission errors on cv.pdf:**
- Problem: PDF owned by `root:root` after Docker build
- Solution: `sudo chown $USER:$USER cv.pdf` or build as non-root user

**Stale Docker cache:**
- Problem: Changes to Dockerfile not reflected in build
- Solution: `docker build --no-cache -t resume-builder .`

**Missing content sections:**
- Problem: New `.typ` file in `content/` not appearing in PDF
- Solution: Add `#include "content/yourfile.typ"` to `cv.typ`

## Git Workflow

**Current repository state:**
- Branch: `master`
- Recent commits focus on: awards, skills, languages updates
- Unstaged changes: `Makefile`, `cv.pdf`, `Dockerfile`, `.dockerignore`

**Recommended commit strategy:**
1. Commit content changes separately from template changes
2. Include regenerated `cv.pdf` in commits (shows actual output)
3. Group related updates (e.g., "Update all 2024 information")

## Performance Notes

**Build times:**
- Docker image build: ~15 seconds (first time) / 1-2 seconds (cached)
- CV compilation: ~1-2 seconds
- Total `make` from clean state: ~3-4 seconds

**File sizes:**
- `cv.pdf`: 52KB (4 pages)
- Docker image: ~150MB
- Template library: ~10KB
- Average content file: 2-3KB

## Future Enhancements

**Potential improvements:**
- Add resume variant (shorter, industry-focused)
- Automate BibTeX import for publications
- Add CI/CD for automatic PDF generation on push
- Multi-language support (French translation)
- Add cover letter template
- QR code for homepage in header

## References

- **Typst Documentation:** https://typst.app/docs/
- **Awesome CV (LaTeX Original):** https://github.com/posquit0/Awesome-CV
- **Roboto Fonts:** https://fonts.google.com/specimen/Roboto
