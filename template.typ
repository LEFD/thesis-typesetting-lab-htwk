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
  // (I / 1) regeln die Abschnitts-Helfer unten (frontmatter/mainmatter/
  // backmatter); die Titelseite schaltet Kopf-/Fußzeile per #page-Block ab.
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

// ===========================================================================
// Abschnitte: Vorspann römisch (I, II, …), Hauptteil arabisch (1, 2, …),
// Anhang setzt die römische Zählung des Vorspanns fort.
// ===========================================================================

// Letzter römischer Seitenstand des Vorspanns – für den Anhang gemerkt.
#let roman-end = state("roman-end", 1)

#let frontmatter(body) = {
  set page(numbering: "I")
  counter(page).update(1)
  body
  // Seitenstand merken, damit der Anhang ihn fortsetzen kann
  context roman-end.update(counter(page).get().first())
}

#let mainmatter(body) = {
  set page(numbering: "1")
  counter(page).update(1)
  body
}

#let backmatter(body) = {
  set page(numbering: "I")
  context counter(page).update(roman-end.get())
  body
}
