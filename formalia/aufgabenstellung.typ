#import "../config.typ": cfg

// Auf dieser Seite keine Kopfzeilen-Linie: sie würde die Schutzzone
// des HTWK-Logos verletzen.

#[
  #set page(header: none)

  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    align: (left, right),
    [#move(dy: -2.1mm)[#image(cfg.logo-fakultaet, height: 16.64mm)]], [#image(cfg.logo-HTWK, width: 41mm)],
  )

  #align(center)[
    #v(1cm)
    #text(size: 20pt, weight: "bold")[Aufgabenstellung zur #cfg.arbeit-typ]

    #text()[*von* #cfg.vorname #cfg.nachname]
  ]

  #heading(
    outlined: false,
    numbering: none,
    level: 3,
  )[Thema]

  #cfg.thema

  #heading(
    outlined: false,
    numbering: none,
    level: 3,
  )[Beschreibung]

  _*Bitte fügen Sie die bei der Anmeldung der Abschlussarbeit genehmigte Aufgabenstellung ein.*_ // <- edit here
]
