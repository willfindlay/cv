// Awesome CV Template for Typst
// Converted from https://github.com/posquit0/Awesome-CV

// ============================================================================
// Colors
// ============================================================================

#let color-awesome = rgb("#DC3522")
#let color-awesome-skyblue = rgb("#0395DE")
#let color-darktext = rgb("#414141")
#let color-text = rgb("#333333")
#let color-graytext = rgb("#5D5D5D")
#let color-lighttext = rgb("#999999")
#let color-gray = rgb("#5D5D5D")

// ============================================================================
// Fonts
// ============================================================================

#let font-header = "Roboto"
#let font-body = "Roboto"  // Fallback to Roboto (closest to Source Sans Pro)

// ============================================================================
// Utility Functions
// ============================================================================

#let vhrulefill(height: 0.9pt, color: color-gray) = {
  line(length: 100%, stroke: height + color)
}

// ============================================================================
// Header Components
// ============================================================================

#let cv-header(
  firstname,
  lastname,
  position: none,
  mobile: none,
  email: none,
  homepage: none,
  github: none,
  linkedin: none,
) = {
  set align(center)

  // Name
  text(
    size: 32pt,
    font: font-header,
    weight: 300,
    fill: color-graytext,
    firstname
  )
  h(0.5em)
  text(
    size: 32pt,
    font: font-header,
    weight: "bold",
    fill: color-text,
    lastname
  )

  v(-1mm)

  // Position
  if position != none {
    text(
      size: 7.6pt,
      font: font-body,
      fill: color-awesome,
      smallcaps(position)
    )
    v(-1mm)
  }

  // Social/Contact info
  let social-items = ()

  if mobile != none {
    social-items.push(link("tel:" + mobile, "☎ " + mobile))
  }

  if email != none {
    social-items.push(link("mailto:" + email, "✉ " + email))
  }

  if homepage != none {
    social-items.push(link("https://" + homepage, "⌂ " + homepage))
  }

  if github != none {
    social-items.push(link("https://github.com/" + github, "■ " + github))
  }

  if linkedin != none {
    social-items.push(link("https://www.linkedin.com/in/" + linkedin, "■ " + linkedin))
  }

  if social-items.len() > 0 {
    text(
      size: 6.8pt,
      font: font-header,
      fill: color-text,
      social-items.join(" | ")
    )
  }

  v(0mm)
}

// ============================================================================
// Footer
// ============================================================================

#let cv-footer(left-content, center-content, right-content) = {
  set text(
    size: 8pt,
    font: font-body,
    fill: color-lighttext
  )

  place(
    bottom,
    dy: -0.5cm,
    grid(
      columns: (1fr, 1fr, 1fr),
      align(left, smallcaps(left-content)),
      align(center, smallcaps(center-content)),
      align(right, smallcaps(right-content))
    )
  )
}

// ============================================================================
// Section
// ============================================================================

#let cv-section(body) = {
  v(3mm)

  // Extract the text content
  let title-str = if type(body) == str {
    body
  } else if type(body) == content {
    // Try to extract text from content
    let s = repr(body)
    // Remove brackets if present
    if s.starts-with("[") and s.ends-with("]") {
      s.slice(1, s.len() - 1)
    } else {
      s
    }
  } else {
    str(body)
  }

  let first-three = title-str.slice(0, calc.min(3, title-str.len()))
  let rest = if title-str.len() > 3 { title-str.slice(3) } else { "" }

  grid(
    columns: (auto, 1fr),
    align: (left, horizon),
    column-gutter: 2pt,
    text(
      size: 16pt,
      font: font-body,
      weight: "bold",
      [#text(fill: color-awesome)[#first-three]#text(fill: color-text)[#rest]]
    ),
    {
      h(0.5em)
      v(-5pt)
      line(length: 100%, stroke: 0.9pt + color-gray)
    }
  )
  v(2.5mm)
}

// ============================================================================
// Subsection
// ============================================================================

#let cv-subsection(title) = {
  v(-0.5mm)
  text(
    size: 12pt,
    font: font-body,
    fill: color-text,
    smallcaps(title)
  )
  v(2.5mm)
}

// ============================================================================
// Entry (for jobs, education, etc.)
// ============================================================================

#let cv-entry(
  title,
  organization,
  location,
  date,
  description: none
) = {
  v(-2mm)

  // Title row
  grid(
    columns: (1fr, auto),
    align: (left, right),
    gutter: 1em,
    text(
      size: 10pt,
      font: font-body,
      weight: "bold",
      fill: color-darktext,
      organization
    ),
    text(
      size: 9pt,
      font: font-body,
      style: "italic",
      fill: color-awesome,
      location
    )
  )

  v(-0.7em)

  // Position/Date row
  grid(
    columns: (1fr, auto),
    align: (left, right),
    gutter: 1em,
    text(
      size: 8pt,
      font: font-body,
      fill: color-graytext,
      smallcaps(title)
    ),
    text(
      size: 8pt,
      font: font-body,
      style: "italic",
      fill: color-graytext,
      date
    )
  )

  // Description
  if description != none {
    v(1mm)
    text(
      size: 9pt,
      font: font-body,
      fill: color-text,
      description
    )
  }

  v(1.5em)
}

// ============================================================================
// Honor/Award Entry
// ============================================================================

#let cv-honor(date, title, description, location) = {
  (
    text(
      size: 9pt,
      font: font-body,
      fill: color-graytext,
      date
    ),
    text(
      size: 9pt,
      font: font-body,
      [
        #text(weight: "bold", fill: color-darktext, title),
        #text(fill: color-graytext, description)
      ]
    ),
    text(
      size: 9pt,
      font: font-body,
      style: "italic",
      fill: color-awesome,
      location
    )
  )
}

// ============================================================================
// Skill Entry
// ============================================================================

#let cv-skill(category, skills) = {
  (
    text(
      size: 10pt,
      font: font-body,
      weight: "bold",
      fill: color-darktext,
      category
    ),
    text(
      size: 9pt,
      font: font-body,
      fill: color-text,
      skills
    )
  )
}

// ============================================================================
// Itemize (bullet points)
// ============================================================================

#let cv-items(items) = {
  v(-3mm)
  set par(leading: 0.65em)
  list(
    marker: [•],
    indent: 2em,
    body-indent: 0.5em,
    spacing: 0.5em,
    ..items.map(item => text(size: 9pt, font: font-body, fill: color-text, item))
  )
  v(-2mm)
}

// ============================================================================
// Document Setup
// ============================================================================

#let cv-setup(
  paper: "us-letter",
  font-size: 11pt,
  footer: none,
  doc
) = {
  set page(
    paper: paper,
    margin: (left: 1.4cm, top: 0.8cm, right: 1.4cm, bottom: 1cm),
    footer-descent: 0cm,
    footer: footer,
  )

  set text(
    font: font-body,
    size: font-size,
    fill: color-text
  )

  set par(justify: false, leading: 0.65em)

  // Link styling
  show link: it => {
    text(fill: color-awesome-skyblue, it)
  }

  doc
}
