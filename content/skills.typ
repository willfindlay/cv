#import "../lib/cv-template.typ": *

#cv-section[Skills]

#table(
  columns: (auto, 1fr),
  stroke: none,
  align: (right, left),
  column-gutter: 1em,
  row-gutter: 0.5em,
  ..cv-skill([Linux Kernel], [Kernel Hacking, Kernel Module Development, eBPF, XDP, bcc, libbpf]),
  ..cv-skill([Systems Programming], [C, C++, Rust]),
  ..cv-skill([Data Science], [Pandas, Numpy, Scipy, R]),
  ..cv-skill([Research], [Applied Security, Operating System Security, Sandboxing, Intrusion Detection]),
)
