= Kapitel: Formatierung <sec:formatierung>

Diese Vorlage ist wie folgt formatiert:

- Einseitiger Druck
- Seitenformat: *A4*
- Schriftgröße: *12 pt*
- Zeilenabstand: *1,5*
- Seitenränder:
  - Links 2,5 cm inkl. Binderandkorrektur
  - Rechts 2,5 cm
  - Oben 2,5 cm inkl. Kopfzeile
  - Unten 4 cm inkl. Fußzeile

= Kapitel: Einführung in Typst <sec:typst-einfuehrung>

Vorab vier wichtige Befehle für das Hervorheben von Informationen.

- Fettgedruckt: *text*
- Kursivschrift: _text_
- Unterstreichen: _text_
- Färben: #text(fill: red)[text]

Das Logo der HTWK kann in dieser Vorlage durch eine Platzhaltergrafik dargestellt werden. Bilddateien wie PNG, JPG, PDF oder SVG lassen sich in Typst direkt als Figure einbinden.

#figure(
  rect(width: 70%, height: 4.5cm, fill: rgb("eef")),
  caption: [Bildunterschrift HTWK Logo],
) <fig:htwk_logo>

Die Platzhaltergrafik ist mit dem Label @fig:htwk_logo referenzierbar.

== Unterkapitel: Verweise und Referenzierung

Der Verweis auf die Nummer von Abbildungen, Tabellen oder anderen Objekten wird direkt über Labels erledigt. Geeignete Präfixe sind beispielsweise fig:, tab:, sec: und eq:.

== Unterkapitel: Fußnoten

Die Verwendung von Fußnoten#footnote[Fußnoten sind Anmerkungen, die aus dem Fließtext ausgelagert sind.] ermöglicht es, den Lesefluss zu verbessern.

== Unterkapitel: Zitate

#quote[
  Eine gute Möglichkeit, Zitate einzufügen und zu formatieren, ist eine sauber gepflegte Bibliografie.
]

Neben den in dieser Vorlage verwendeten Beispielen @ghia_1982 und @sagan_1993 können weitere Quellen problemlos ergänzt werden.

== Unterkapitel: Matheumgebung

Für mathematische Ausdrücke kann Typst direkt im Fließtext genutzt werden, zum Beispiel $a^2 + b^2 = c^2$ oder $10%$.

== Unterkapitel: Tabellen

Die Tabellen-Umgebung eignet sich zur strukturierten Darstellung von Daten.

#figure(
  table(
    columns: (auto, auto, auto, auto),
    inset: 6pt,
    [*Symbolname*], [*kleines Symbol*], [*großes Symbol*], [*Variable*],
    [alpha], [$alpha$], [---], [---],
    [omega], [$omega$], [$Omega$], [---],
    [pi], [$pi$], [$Pi$], [$pi$],
    [phi], [$phi$], [$Phi$], [$pi$],
  ),
  caption: [Tabellenüberschrift],
) <tab:label>

== Unterkapitel: Links

Für Verlinkungen zu Webseiten kann die Linkfunktion eingesetzt werden: #link("https://www.zahlen-kern.de/editor")[Formeleditor].
