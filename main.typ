#import "config.typ": cfg
#import "template.typ": project

#show: project.with(cfg: cfg)

// ===========================================================================
// Deckblatt
// ===========================================================================
#include "formalia/deckblatt.typ"

// ===========================================================================
// Vorspann – römische Seitenzahlen
// ===========================================================================
#set page(numbering: "I")
#counter(page).update(1)

#include "formalia/sperrvermerk.typ"
#pagebreak()

#include "formalia/aufgabenstellung.typ"
#pagebreak()

#include "formalia/abstract.typ"
#pagebreak()

#include "formalia/abkuerzungsverzeichnis.typ"
#pagebreak()

#outline(title: [Inhaltsverzeichnis], indent: auto)
#pagebreak()

#outline(title: [Abbildungsverzeichnis], target: figure.where(kind: image))
#pagebreak()

#outline(title: [Tabellenverzeichnis], target: figure.where(kind: table))
#pagebreak()

#include "formalia/symbolverzeichnis.typ"
#pagebreak()

// römischen Seitenstand merken, um ihn im Anhang fortzusetzen
#let roman-page = state("roman-page", 0)
#context { roman-page.update(counter(page).get().first()) }

// ===========================================================================
// Hauptteil – arabische Seitenzahlen
// ===========================================================================
#set page(numbering: "1")
#counter(page).update(1)

#include "chapters/einleitung.typ"
#pagebreak()

#include "chapters/typst_grundlagen.typ"
#pagebreak()

#include "chapters/ausblick.typ"
#pagebreak()

// ===========================================================================
// Anhang – römische Seitenzahlen (an den Vorspann anschließend)
// ===========================================================================
#context { counter(page).update(roman-page.get()) }
#set page(numbering: "I")

#include "appendix/anhang.typ"
#pagebreak()

= Literaturverzeichnis <sec:literatur>
#bibliography("references.bib", style: "ieee", title: none)
#pagebreak()

#include "formalia/eidesstattliche_erklaerung.typ"
