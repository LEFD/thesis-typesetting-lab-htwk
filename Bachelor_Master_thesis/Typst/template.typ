#import "Daten.typ": *

#let project(body) = {
  set document(author: vorname + " " + name, title: thema)

  set text(font: "New Computer Modern", lang: "de", size: 12pt)
  set par(justify: true, leading: 0.8em, first-line-indent: 0em)
  set heading(numbering: "1.1")
  set math.equation(numbering: "(1)")

  show figure.caption: it => [
    #text(size: 9pt)[*#it.supplement #it.counter.display():* #it.body]
  ]

  show heading: set block(above: 2em, below: 1.5em) // 1.5em Abstand zwischen Überschrift und folgendem Text

  set page(
    paper: "a4",
    margin: (x: 25mm, top: 25mm, bottom: 35mm),
    numbering: none,
    header: none,
    footer: none,
  )

  set page(
    paper: "a4",
    margin: (x: 25mm, top: 25mm, bottom: 35mm),
    numbering: "i",
    header: context [
      #line(length: 100%, stroke: 0.5pt)
      #v(1.5mm)
      #running-header()
    ],
    footer: context [
      #line(length: 100%, stroke: 0.5pt)
      #v(2mm)
      #align(center)[#counter(page).display()]
    ],
  )

  counter(page).update(1)

  body
}
