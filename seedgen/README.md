# Silksong Archipelago – Seed-Generator

- `silksong.apworld` – die Welt (Archiv des Quellordners).
- `silksong_test.yaml` – Beispiel-Spieler-Konfiguration.
- `generate.sh` – generiert einen Seed.

## Seed generieren
```
./generate.sh [/pfad/zu/Archipelago]   # Default: /tmp/Archipelago
```
Erzeugt eine `AP_*.zip` in `<Archipelago>/output/`; die enthaltene
`AP_*.archipelago` hostet man mit `MultiServer.py`.

Hinweis: `generate.sh` entpackt die apworld als echten Ordner nach
`<Archipelago>/worlds/silksong` (die Welt liest ihre Daten per Datei-`open()`,
ein reines Zip-`custom_worlds` funktioniert daher NICHT).
