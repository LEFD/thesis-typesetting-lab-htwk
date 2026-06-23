# HTWK Typst – Vorlage für Abschlussarbeiten

Eine schlanke [Typst](https://typst.app/)-Vorlage für Beleg-, Bachelor- und
Masterarbeiten im Stil der HTWK Leipzig.

> ⚠️ **Kein offizielles Template der HTWK Leipzig.** Privates, experimentelles
> Projekt. Die Nutzung für offizielle Abgaben erfolgt auf eigene Gefahr – die
> Vorgaben der jeweiligen Fakultät sind eigenständig abzugleichen.

## Schnellstart

1. Repository öffnen (VS Code mit der Erweiterung
   [Tinymist](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist),
   wird über `.vscode/extensions.json` empfohlen).
2. **Einmalig** die lokale Konfiguration anlegen:

   ```sh
   cp config-override.example.typ config-override.typ
   ```

3. `main.typ` öffnen und die Live-Vorschau von Tinymist starten.
4. Persönliche Daten in `config-override.typ` eintragen, Inhalte in
   `chapters/` schreiben.

## Konfiguration

Die Angaben zur Arbeit (Name, Thema, Studiengang, Logos …) liegen zentral in
zwei Dateien:

| Datei | Versioniert? | Zweck |
| --- | --- | --- |
| `config.typ` | ✅ | Standardwerte der Vorlage. Hier nichts Persönliches eintragen. |
| `config-override.typ` | ❌ (git-ignored) | Deine persönlichen Werte. Überschreibt einzelne Felder aus `config.typ`. |
| `config-override.example.typ` | ✅ | Kopiervorlage für `config-override.typ`. |

In `config-override.typ` werden nur die Felder gesetzt, die vom Standard
abweichen – alle übrigen kommen aus `config.typ` (`defaults + overrides`).

> Weil `config-override.typ` von Git ignoriert wird, fehlt sie in einem frischen
> Clone. Deshalb der einmalige `cp`-Schritt aus dem Schnellstart – sonst kann
> `config.typ` die Datei nicht importieren.

## Projektstruktur

```text
images/
  logos/        HTWK-Logos (eigene Abbildungen: direkt in images/)
formalia/       formale Pflichtteile (Deckblatt, Sperrvermerk,
                Aufgabenstellung, Abstract, Abkürzungs-/Symbolverzeichnis,
                Eidesstattliche Erklärung)
chapters/       eigene Kapitel   ← hier schreibst du
appendix/       Anhang           ← hier schreibst du
main.typ        Dokument-Reihenfolge (Deckblatt → Vorspann → Hauptteil → Anhang)
template.typ    Layout: project(), flex-caption()
config.typ      Standardwerte (+ Merge der Overrides)
references.bib  Literaturquellen
```

- **Seitenzahlen:** Vorspann römisch (`I, II, …`), Hauptteil arabisch
  (`1, 2, …`), Anhang setzt die römische Zählung fort.
- **`flex-caption(lang, kurz)`** in `template.typ` erlaubt eine lange
  Bildunterschrift im Text und eine kurze im Abbildungsverzeichnis.

## Lizenz

Siehe [LICENSE](LICENSE).
