#import "Daten.typ": *

// Titelseite im HTWK-Stil (Platzhalterlogos statt eingebetteter Bilder)
#v(6mm)
#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: (start, right),
  // linke Spalte: Fakultätsbezeichnung
  [#image(logoFaculty, height: 15mm)],
  // rechte Spalte: HTWK-Block
  [#image("Abbildungen/HTWK_Zusatz_de_V_Black_K.jpg", width: 40mm)],
)

---

#grid(
  columns: 2,
  // gutter: 1em,

  align: (left, right),
  [
    #scale(100%)[
      #image("Abbildungen/HTWK-Fakultaetszusatz_ing_schwarz_de.png")
    ]
  ],
  [
    #scale(100%)[
  #image("Abbildungen/HTWK_Zusatz_de_V_Black_K.jpg")

    ]
  ],
)

---

#scale(40%)[
  #image("Abbildungen/HTWK-Fakultaetszusatz_ing_schwarz_de.png")
]

#scale(100%)[
  #image("Abbildungen/HTWK_Zusatz_de_V_Black_K.jpg")
]


// #image("Abbildungen/HTWK_Zusatz_de_H_Black_sRGB.png")


#v(2cm)

#align(center)[
  #text(size: 22pt, weight: "bold")[#arbeit]
]

#v(1.5cm)

#table(
  columns: (5cm, 1fr),
  inset: 9pt,
  stroke: none,
  [*Thema:*], [#thema],
  [*vorgelegt von:*], [#vorname #name],
  [*Studiengang:*], [#studiengang],
  [*Studienprofil:*], [#studienprofil],
)

#v(1cm)

#table(
  columns: (8cm, 1fr),
  inset: 9pt,
  stroke: none,
  [*verantwortlicher Hochschullehrer:*], [#professor],
  [*betrieblicher Betreuer:*], [#chef],
)

#v(1.8cm)

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: (left, right),
  [#text(size: 10pt)[Ausgabetermin: 01. Juli 2024]], [#text(size: 10pt)[Abgabetermin: 23.09.2024]],
)

#v(1cm)

#text(size: 11pt)[Leipzig, #datum]
