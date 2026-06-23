#import "config.typ": cfg
#import "template.typ": project, frontmatter, mainmatter, backmatter

#show: project.with(cfg: cfg)

// ===========================================================================
// Deckblatt
// ===========================================================================
#include "formalia/deckblatt.typ"

// ===========================================================================
// Vorspann – römische Seitenzahlen (I, II, …)
// ===========================================================================
#frontmatter[
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
]

// ===========================================================================
// Hauptteil – arabische Seitenzahlen (1, 2, …)
// ===========================================================================
#mainmatter[
  #include "chapters/einleitung.typ"
  #pagebreak()

  #include "chapters/typst_grundlagen.typ"
  #pagebreak()

  #include "chapters/ausblick.typ"
  #pagebreak()
]

// ===========================================================================
// Anhang – römische Seitenzahlen (setzt den Vorspann fort)
// ===========================================================================
#backmatter[
  #include "appendix/anhang.typ"
  #pagebreak()

  = Literaturverzeichnis <sec:literatur>
  #bibliography("references.bib", style: "ieee", title: none)
  #pagebreak()

  #include "formalia/eidesstattliche_erklaerung.typ"
]
