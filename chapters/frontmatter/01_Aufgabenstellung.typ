#import "../../config.typ": cfg

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: (left, right),
  // linke Spalte: Fakultätsbezeichnung
  [#image(cfg.logoFaculty, width: 70mm)],
  // rechte Spalte: HTWK-Block
  [#image(cfg.logoHTWK, width: 50mm)],
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
  [*von:*], [#cfg.vorname #cfg.name],
  [*Thema:*], [#cfg.thema],
)

#v(1cm)
#grid(
  columns: (3cm, 1fr),
  gutter: 0cm,
  [*Erläuterung:*],
  [Bitte fügen Sie die bei der Anmeldung der Abschlussarbeit genehmigte Aufgabenstellung ein.],
)
