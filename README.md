# HTWK Typst - Vorlage für Abschlussarbeiten

Eine [Typst](https://typst.app/)-Vorlage für Beleg-, Bachelor- und
Masterarbeiten im Stil der HTWK Leipzig.

> ⚠️ **Kein offizielles Template der HTWK Leipzig!** Dieses Projekt befindet sich in der Entwicklung. Die Nutzung für offizielle Abgaben erfolgt auf eigene Gefahr - die Vorgaben der jeweiligen Fakultät sind eigenständig abzugleichen.

## Schnellstart

1. Eigenes Repository von dieser Template erstellen
1. Repository lokal in VS Code öffnen (mit Erweiterung
   [Tinymist](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist))
1. Einmalig die *lokale* Konfiguration anlegen (das Projekt kompiliert sonst nicht):

   ```sh
   cp config-override.example.typ config-override.typ
   ```

   oder:

   in VS Code den Task `config-override.typ anlegen` ausführen

1. `main.typ` öffnen und die Live-Vorschau von Tinymist starten

    Klicke dazu oben rechts im Editor-Fenster auf das Live Preview Icon (ein kleines Dokument mit einer Lupe)

1. Persönliche Daten in `config-override.typ` eintragen, Inhalte in
   `chapters/` schreiben

## Konfiguration

Die Angaben zur Arbeit (Name, Thema, Studiengang, Logos …) liegen zentral in
zwei Dateien:

| Datei | Versioniert? | Zweck |
| --- | --- | --- |
| `config.typ` | ✅ | Standardwerte der Vorlage. (Hier nichts Persönliches eintragen). |
| `config-override.typ` | ❌ (git-ignored) | Deine persönlichen Werte. Überschreibt einzelne Felder aus `config.typ`. |

## Projektstruktur

```text
appendix/             Anhang           ← hier schreibst du
chapters/             eigene Kapitel   ← hier schreibst du
formalia/             formale Pflichtteile (Deckblatt, Sperrvermerk, ...)
images/               eigene Abbildungen
  logos/              HTWK Logos

config.typ            Konfiguration (im Git Tracking)
config-override.typ   Konfiguration für private Daten (vom Git Tracking ausgeschlossen)
main.typ              Dokument-Reihenfolge (Deckblatt → Vorspann → Hauptteil → Anhang)
template.typ          Formatierung und Funktionen des Projektes
references.bib        Literaturquellen
```

- **Seitenzahlen:** Vorspann römisch (`I, II, …`), Hauptteil arabisch
  (`1, 2, …`), Anhang setzt die römische Zählung fort.
- **`flex-caption(lang, kurz)`** in `template.typ` erlaubt eine lange
  Bildunterschrift im Text und eine kurze im Abbildungsverzeichnis.

## Projekt Exportieren

Dem Projekt liegt ein Script bei, welches die Arbeit kompiliert und einen deskriptiven Dateinamen vergibt. Die kompilierte PDF Datei befindet sich dann im Order `.export`. In VS Code kann das Script mit "Run Build Task" (Taskenkombination: `Ctrl` + `Shift` + `B`) aufgerufen werden.

## KI-Hinweis

> 🤖 Teile dieser Vorlage (Struktur, Code und Dokumentation) wurden mit
> KI-Unterstützung (Claude Opus 4.8) erstellt und überarbeitet.

## Lizenz

Siehe [LICENSE](LICENSE).
