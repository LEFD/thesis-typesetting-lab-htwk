#import "../config.typ": cfg

// Deckblatt / Titelseite im HTWK-Stil.
// Eigener #page-Block ohne Kopf-/Fußzeile und ohne Seitenzahl.
#page(header: none, footer: none, numbering: none)[
  #v(6mm)
  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    align: (left, right),
    // linke Spalte: Fakultätsbezeichnung
    [#image(cfg.logoFaculty, width: 70mm)],
    // rechte Spalte: HTWK-Block
    [#image(cfg.logoHTWK, width: 50mm)],
  )

  #v(2cm)
  #align(center)[#text(size: 22pt, weight: "bold")[#cfg.arbeit]]
  #v(1.5cm)

  #table(
    columns: (5cm, 1fr),
    inset: 9pt,
    stroke: none,
    [*Thema:*], [#cfg.thema],
    [*vorgelegt von:*], [#cfg.vorname #cfg.name],
    [*Studiengang:*], [#cfg.studiengang],
    [*Studienprofil:*], [#cfg.studienprofil],
  )

  #v(1cm)
  #table(
    columns: (8cm, 1fr),
    inset: 9pt,
    stroke: none,
    [*verantwortlicher Hochschullehrer:*], [#cfg.professor],
    [*betrieblicher Betreuer:*], [#cfg.chef],
  )

  #v(1.8cm)
  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    align: (left, right),
    [#text(size: 10pt)[Ausgabetermin: #cfg.ausgabetermin]],
    [#text(size: 10pt)[Abgabetermin: #cfg.abgabetermin]],
  )

  #v(1cm)
  #text(size: 11pt)[#cfg.ort, #cfg.datum]
]
