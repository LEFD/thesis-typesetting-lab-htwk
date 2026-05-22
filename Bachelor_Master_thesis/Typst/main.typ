#import "template.typ": project
#import "@preview/hydra:0.6.2": hydra


#show: project[
	#set page(header: none, footer: none, numbering: none)
	#include "Title.typ"
	#pagebreak()

	#set page(
		numbering: "I",
		header: context [
    #align(right, text(fill: luma(50%), hydra(1, skip-starting: false)))  //das hier auf true setzten damit auf der Seite wo die section beginnt kein name im header steht
    #line(length: 100%, stroke: 0.5pt)],
		footer: context [
			#line(length: 100%, stroke: 0.5pt)
			#v(2mm)
			#align(right)[#counter(page).display()]
		],
	)
  
	#counter(page).update(1)

	#include "Sections/notwendig/00_Sperrvermerk.typ"
	#pagebreak()

	#include "Sections/notwendig/01_Aufgabenstellung.typ"
	#pagebreak()

	#include "Sections/notwendig/02_Abstract.typ"
	#pagebreak()

	#include "Sections/notwendig/03_Abkuerzungsverzeichnis.typ"
	#pagebreak()

	#outline(title: [Inhaltsverzeichnis], indent: auto)
	#pagebreak()

	#outline(title: [Abbildungsverzeichnis], target: figure.where(kind: image))
	#pagebreak()

	#outline(title: [Tabellenverzeichnis], target: figure.where(kind: table))
	#pagebreak()

	#include "Sections/notwendig/04_Symbolverzeichnis.typ"
	#pagebreak()

	#let roman-page = state("roman-page", 0)
		#context {
  	roman-page.update(counter(page).get().first())
	}

	#set page(numbering: "1")
	#counter(page).update(1)

	#include "Sections/01_Einleitung.typ"
	#pagebreak()

	#include "Sections/02_Typst_grundlagen.typ"
	#pagebreak()

	#include "Sections/06_Ausblick.typ"
	#pagebreak()

	#context {
  	counter(page).update(roman-page.get())
	}

	#set page(numbering: "I")

	#include "Sections/notwendig/08_Anhang.typ"
	#pagebreak()

	= Literaturverzeichnis <sec:literatur>
	#bibliography("references.bib", style: "ieee",title: none)
	#pagebreak()

	#include "Sections/notwendig/10_Eidesstattliche_Erklaerung.typ"
]
