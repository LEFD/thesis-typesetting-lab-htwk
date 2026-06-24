#import "../config.typ": cfg

// Auf dieser Seite keine Kopfzeilen-Linie: sie würde die Schutzzone
// des HTWK-Logos verletzen.

#[
  #set page(header: none)

  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    align: (left, right),
    [#move(dy: -2.1mm)[#image(cfg.logo-fakultaet, height: 16.64mm)]],
    [#image(cfg.logo-HTWK, width: 41mm)],
  )

  #align(center)[
    #v(1cm)
    #text(size: 20pt, weight: "bold")[Aufgabenstellung zur Abschlussarbeit]
  ]

  #v(0.8cm)
  #table(
    columns: (auto, 1fr),
    inset: 7pt,
    stroke: none,
    [*von:*], [#cfg.vorname #cfg.nachname],
    [*Thema:*], [#cfg.thema],
  )

  #v(1cm)
  #grid(
    columns: (3cm, 1fr),
    gutter: 0cm,
    [*Erläuterung:*], [Bitte fügen Sie die bei der Anmeldung der Abschlussarbeit genehmigte Aufgabenstellung ein.],
  )
]
