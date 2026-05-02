#import "template.typ": project
#import "@preview/hydra:0.6.2": hydra


#show: project[
	#set page(header: none, footer: none, numbering: none)
	#include "Title.typ"
	#pagebreak()

	#set page(
		numbering: "I",
		header: context [
    #align(right, text(fill: luma(50%), hydra(1, skip-starting: false)))  //das hier auf true setzten damit auf der seite wo die sction beginnt kein name im header steht
    #line(length: 100%, stroke: 0.5pt)],
		footer: context [
			#line(length: 100%, stroke: 0.5pt)
			#v(2mm)
			#align(right)[#counter(page).display()]
		],
	)
  
	#counter(page).update(1)

	#include "Sections/00_Sperrvermerk.typ"
	#pagebreak()

	#include "Sections/01_Aufgabenstellung.typ"
	#pagebreak()

	#include "Sections/02_Abstract.typ"
	#pagebreak()

	#include "Sections/03_Abkuerzungsverzeichnis.typ"
	#pagebreak()

	#outline(title: [Inhaltsverzeichnis], indent: auto)
	#pagebreak()

	#outline(title: [Abbildungsverzeichnis], target: figure.where(kind: image))
	#pagebreak()

	#outline(title: [Tabellenverzeichnis], target: figure.where(kind: table))
	#pagebreak()

	#include "Sections/04_Symbolverzeichnis.typ"
	#pagebreak()

	#set page(numbering: "1")
	#counter(page).update(1)

	#include "Sections/05_Einleitung.typ"
	#pagebreak()

	#include "Sections/06_Beispiel_Text.typ"
	#pagebreak()

	#include "Sections/07_Ausblick.typ"
	#pagebreak()

	#include "Sections/08_Anhang.typ"
	#pagebreak()

	#include "Sections/09_Literaturverzeichnis.typ"
	#pagebreak()

	#include "Sections/10_Eidesstattliche_Erklaerung.typ"
]
