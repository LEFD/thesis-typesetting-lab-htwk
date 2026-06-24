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
    // Buchstaben Fakultätsabkürzung sollen die gleiche Höhe haben, wie der HTWK Schriftzug
    [#move(dy: -2.1mm)[#image(cfg.logo-fakultaet, height: 16.64mm)]],
    // "height 16.64 mm" entspricht Buchstabenhöhe von ca. 10 mm
    // rechte Spalte: HTWK-Block
    // HTWK Schriftzug Breite: 40 mm
    [#image(cfg.logo-HTWK, width: 41mm)],
    // "width 41 mm" entspricht einer Breite der HTWK Schriftzuges von 40 mm, resultierende Höhe ca. 10 mm
  )

  #v(2cm)
  #align(center)[#text(size: 22pt, weight: "bold")[#cfg.arbeit-typ]]
  #v(1.5cm)

  #table(
    columns: (5cm, 1fr),
    inset: 9pt,
    stroke: none,
    [*Thema:*], [#cfg.thema],
    [*vorgelegt von:*], [#cfg.vorname #cfg.nachname],
    [*Studiengang:*], [#cfg.studiengang],
    [*Studienprofil:*], [#cfg.studienprofil],
  )

  #v(1cm)
  #table(
    columns: (8cm, 1fr),
    inset: 9pt,
    stroke: none,
    [*verantwortlicher Hochschullehrer:*], [#cfg.betreuer-hochschule],
    [*betrieblicher Betreuer:*], [#cfg.betreuer-betrieb],
  )

  #v(1.8cm)
  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    align: (left, right),
    [#text(size: 10pt)[Ausgabetermin: #cfg.termin-ausgabe]], [#text(size: 10pt)[Abgabetermin: #cfg.termin-abgabe]],
  )

  #v(1cm)
  #text(size: 11pt)[#cfg.ort, #cfg.datum]
]
