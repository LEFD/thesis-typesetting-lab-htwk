#import "@preview/hydra:0.6.2": hydra

// ===========================================================================
// Hilfsfunktionen (vormals Sections/notwendig/globals.typ)
// ===========================================================================

// true, solange ein #outline gesetzt wird – siehe flex-caption.
#let in-outline = state("in-outline", false)

// Lange Bildunterschrift im Fließtext, kurze Fassung im Abbildungsverzeichnis.
#let flex-caption(long, short) = context if in-outline.get() { short } else { long }

// ===========================================================================
// Dokumentvorlage  (Deckblatt: siehe formalia/deckblatt.typ)
// ===========================================================================
#let project(cfg: (:), body) = {
  set document(author: cfg.vorname + " " + cfg.nachname, title: cfg.thema)

  set text(font: "New Computer Modern", lang: "de", size: 12pt)
  set par(justify: true, leading: 0.8em, first-line-indent: 0em)
  set heading(numbering: "1.1")
  set math.equation(numbering: "(1)")

  show figure.caption: it => [
    #text(size: 9pt)[*#it.supplement #it.counter.display():* #it.body]
  ]

  // 1.5em Abstand zwischen Überschrift und folgendem Text
  show heading: set block(above: 2em, below: 1.5em)

  // Kopf-/Fußzeile zentral für das gesamte Dokument. Die Seitennummerierung
  // (i / 1) wird in main.typ pro Abschnitt umgeschaltet; die Titelseite
  // schaltet Kopf-/Fußzeile über ihren eigenen #page-Block ab.
  set page(
    paper: "a4",
    margin: (x: 25mm, top: 25mm, bottom: 35mm),
    header: context [
      // skip-starting: true -> auf der Startseite eines Abschnitts kein Name im Header
      #align(right, text(fill: luma(50%), hydra(1, skip-starting: false)))
      #line(length: 100%, stroke: 0.5pt)
    ],
    footer: context [
      #line(length: 100%, stroke: 0.5pt)
      #v(2mm)
      #align(right)[#counter(page).display()]
    ],
  )

  show outline: it => {
    in-outline.update(true)
    it
    in-outline.update(false)
  }

  body
}
