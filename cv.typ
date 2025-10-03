// Awesome CV - Typst Version
// William Findlay's Curriculum Vitae

#import "lib/cv-template.typ": *

#show: cv-setup.with(
  footer: context {
    cv-footer(
      datetime.today().display("[month repr:long] [day], [year]"),
      [William Findlay #sym.space.nobreak #sym.dot.c #sym.space.nobreak Curriculum Vitae],
      counter(page).display("1"),
    )
  }
)

// Header
#cv-header(
  "William",
  "Findlay",
  position: [Security Researcher #sym.dot.c Systems Programmer #sym.dot.c Kernel Hacker],
  mobile: "(613) 296-1240",
  email: "william@williamfindlay.com",
  homepage: "www.williamfindlay.com",
  github: "willfindlay",
  linkedin: "willfindlay",
)

// Content sections
#include "content/education.typ"
#include "content/skills.typ"
#include "content/languages.typ"
#include "content/academic-experience.typ"
#include "content/other-experience.typ"
#include "content/awards.typ"
#include "content/talks.typ"

#pagebreak()

#include "content/publications.typ"
#include "content/software.typ"
