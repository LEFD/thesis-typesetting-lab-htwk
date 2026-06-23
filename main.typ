#import "config.typ": cfg
#import "template.typ": project, titlepage

#show: project.with(cfg: cfg)

// ===========================================================================
// Titelseite (eigener #page-Block ohne Kopf-/Fußzeile und Seitenzahl)
// ===========================================================================
#titlepage(cfg)

// ===========================================================================
// Vorspann – römische Seitenzahlen
// ===========================================================================
#set page(numbering: "I")
#counter(page).update(1)

#include "chapters/frontmatter/00_Sperrvermerk.typ"
#pagebreak()

#include "chapters/frontmatter/01_Aufgabenstellung.typ"
#pagebreak()

#include "chapters/frontmatter/02_Abstract.typ"
#pagebreak()

#include "chapters/frontmatter/03_Abkuerzungsverzeichnis.typ"
#pagebreak()

#outline(title: [Inhaltsverzeichnis], indent: auto)
#pagebreak()

#outline(title: [Abbildungsverzeichnis], target: figure.where(kind: image))
#pagebreak()

#outline(title: [Tabellenverzeichnis], target: figure.where(kind: table))
#pagebreak()

#include "chapters/frontmatter/04_Symbolverzeichnis.typ"
#pagebreak()

// römischen Seitenstand merken, um ihn im Anhang fortzusetzen
#let roman-page = state("roman-page", 0)
#context { roman-page.update(counter(page).get().first()) }

// ===========================================================================
// Hauptteil – arabische Seitenzahlen
// ===========================================================================
#set page(numbering: "1")
#counter(page).update(1)

#include "chapters/content/01_Einleitung.typ"
#pagebreak()

#include "chapters/content/02_Typst_grundlagen.typ"
#pagebreak()

#include "chapters/content/06_Ausblick.typ"
#pagebreak()

// ===========================================================================
// Anhang – römische Seitenzahlen (an den Vorspann anschließend)
// ===========================================================================
#context { counter(page).update(roman-page.get()) }
#set page(numbering: "I")

#include "chapters/backmatter/08_Anhang.typ"
#pagebreak()

= Literaturverzeichnis <sec:literatur>
#bibliography("references.bib", style: "ieee", title: none)
#pagebreak()

#include "chapters/backmatter/10_Eidesstattliche_Erklaerung.typ"
