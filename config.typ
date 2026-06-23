// Zentrale Konfiguration der Arbeit.
//
// Diese Datei enthält die VERSIONIERTEN Standardwerte der Vorlage.
// Persönliche, NICHT versionierte Angaben gehören in `config-override.typ`
// (siehe `config-override.example.typ`). Dort gesetzte Felder gewinnen.
#import "config-override.typ": overrides

#let defaults = (
  vorname: "Maxi",
  name: "Musterfrau",
  arbeit: "Beleg-/Bachelor-/Masterarbeit",
  studiengang: "Elektrotechnik und Informationstechnik",
  studienprofil: "Elektronische Schaltungstechnik und Signalverarbeitung",
  thema: "Nachweis der Fähigkeit erlerntes Wissen anwenden zu können",
  professor: "Prof. Dr. No",
  chef: "Frau Yes",
  faculty: "Fakultät Ingenieurwissenschaften",
  ort: "Leipzig",
  ausgabetermin: "01. Juli 2024",
  abgabetermin: "23.09.2024",
  // alternativ ein fester Wert, z. B. "01.01.2026"
  datum: datetime.today().display("[day].[month].[year]"),

  // HTWK-Logos (projekt-absolute Pfade, damit sie aus jeder Datei funktionieren)
  logoHTWK: "/assets/logos/HTWK_Zusatz_de_V_Black_sRGB.png",
  logoFaculty: "/assets/logos/HTWK-Fakultaetszusatz_ing_schwarz_de.png",
)

// Zusammengeführte Konfiguration: Werte aus config-override.typ überschreiben.
#let cfg = defaults + overrides
