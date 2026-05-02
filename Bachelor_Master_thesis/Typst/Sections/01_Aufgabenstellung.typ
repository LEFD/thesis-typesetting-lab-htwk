#import "../Daten.typ": *

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: (left, right),
  // linke Spalte: Fakultätsbezeichnung
  [#image("../Abbildungen/HTWK-Fakultaetszusatz_ing_schwarz_de.png", width: 70mm)],
  // rechte Spalte: HTWK-Block (Platzhalter)
  [#image("../Abbildungen/HTWK_Zusatz_de_V_Black_K-eps-converted-to.pdf", width: 50mm)]
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
  [*von:*], [#vorname #name],
  [*Thema:*], [#thema],
)

#v(1cm)
#grid(
  columns: (3cm, 1fr),
  gutter: 0cm,
  [*Erläuterung:*],
  [Bitte fügen Sie die bei der Anmeldung der Abschlussarbeit genehmigte Aufgabenstellung ein.],
)
