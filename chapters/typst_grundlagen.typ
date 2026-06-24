#import "../template.typ": flex-caption
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
- Unterstreichen: #underline[text]
- Färben: #text(fill: red)[text]

Das Logo der HTWK kann in dieser Vorlage durch eine Platzhaltergrafik dargestellt werden. Bilddateien wie PNG, JPG, PDF oder SVG lassen sich in Typst direkt als Figure einbinden.

#figure(
  rect(width: 70%, height: 4.5cm, fill: rgb("eef")),
  caption: [Bildunterschrift HTWK Logo],
) <fig:htwk_logo>

Die Platzhaltergrafik ist mit dem Label @fig:htwk_logo referenzierbar.

In dieser Vorlage hier wurde eine weitere Funktion hinzugefügt, um die Bildunterschriften besser anpassen zu können. Hier wurde eine neue Funktion eingefügt, welche dafür sorgt, dass einmal der Text angegeben werden kann, der unter dem Bild angezeigt werden soll und einmal der Text angegeben werden kann, der im Abbildungsverzeichnis auftauchen soll. Um diese Funktion nutzen zu können, muss ganz oben in der Datei folgendes noch eingefügt werden:

```typ
#import "../template.typ": flex-caption
```

#figure(
  rect(width: 70%, height: 4.5cm, fill: rgb("eef")),
  caption: flex-caption(
    [Hier sieht man den Text, der angezeigt wird, und ein Bild.  (Quelle: Eigene Aufnahme)],
    [Und hier sieht man jetzt den Text, der im Abbildungsverzeichnis erscheint. ],
  ),
) <fig:htwk_logo_new>

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


== Code einfügen

Um Code im Text einzufügen, kann man das wie folgt umsetzen:

```python
a + b = c
print("Hallo Welt")
```
oder auch andere Sprachen:
```c
a + b = c
printf("Hallo Welt")
```
