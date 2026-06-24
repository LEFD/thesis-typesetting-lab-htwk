// Zentrale Konfiguration der Arbeit (versionierte Standardwerte).
//
// Persönliche, nicht versionierte Angaben gehören in `config-override.typ`.
// Dazu `config-override.example.typ` kopieren:
//   cp config-override.example.typ config-override.typ

#import "config-override.typ": overrides

#let defaults = (
  vorname: "Maxi",
  nachname: "Musterfrau",
  studiengang: "Elektrotechnik und Informationstechnik",
  studienprofil: "Elektronische Schaltungstechnik und Signalverarbeitung",
  arbeit-typ: "Beleg-/Bachelor-/Masterarbeit",
  thema: "Nachweis der Fähigkeit erlerntes Wissen anwenden zu können",
  betreuer-hochschule: "Prof. Dr. No",
  betreuer-betrieb: "Frau Yes",
  ort: "Leipzig",
  termin-ausgabe: "01.07.2024",
  termin-abgabe: "23.09.2024",
  // oder fester Wert, z. B. "01.01.2026"
  datum: datetime.today().display("[day].[month].[year]"),

  // HTWK-Logos (projekt-absolute Pfade)
  logo-HTWK: "/images/logos/HTWK_Zusatz_de_V_Black_sRGB.png",
  logo-fakultaet: "/images/logos/HTWK-Fakultaetszusatz_ing_schwarz_de.png",
)

// Overrides überschreiben die Standardwerte.
// Leeres bzw. fehlendes Override (z. B. alle Felder auskommentiert) wird toleriert.
#let cfg = defaults + (if type(overrides) == dictionary { overrides } else { (:) })
