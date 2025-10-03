#import "../lib/cv-template.typ": *

#cv-section[Languages]

#table(
  columns: (auto, 1fr),
  stroke: none,
  align: (right, left),
  column-gutter: 1em,
  row-gutter: 0.5em,
  ..cv-skill([#h(4em)Programming], [C, Python, Rust, C++, Java, Javascript, R]),
  ..cv-skill([Markup], [LaTeX, HTML, CSS]),
  ..cv-skill([Human], [English, French]),
)
