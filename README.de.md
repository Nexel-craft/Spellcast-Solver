# Spellcast Solver

Ein leistungsstarker 5x5 Wortlöser, der in Python mit einer modernen Benutzeroberfläche (`customtkinter`) entwickelt wurde und **speziell für die Discord-Aktivität "Spellcast" konzipiert ist**. Bitte beachten Sie, dass dies *kein* universeller Boggle-Solver ist. Dieser Solver hilft Ihnen, die Wörter mit den meisten Punkten auf einem Spellcast-Brett zu finden, und berücksichtigt dabei spezielle Felder wie Diamanten, Doppelwort (DW), Doppelbuchstabe (DL), Dreifachbuchstabe (TL) und sogar Buchstaben-Joker (Swaps)!

## Screenshots

<p align="center">
  <img src="images/default_interface.png" width="45%" alt="Standard-Schnittstelle" />
  <img src="images/solver_in_use.png" width="45%" alt="Solver im Einsatz" />
</p>
<p align="center">
  <img src="images/light_mode.png" width="45%" alt="Heller Modus" />
  <img src="images/language_menu.png" width="45%" alt="Sprachmenü" />
</p>

## Funktionen
- **Interaktives 5x5-Raster**: Klicken und tippen Sie Ihre Buchstaben direkt in das Raster ein.
- **Spezialfeld-Markierungen**: Markieren Sie ganz einfach Diamanten und Multiplikatoren, um die absolute maximale Punktzahl zu berechnen.
- **Joker-Unterstützung (Swaps)**: Konfigurieren Sie die Anzahl der erlaubten Jokertausche, und lassen Sie den Solver die komplexesten Wörter finden.
- **Multithreading**: Nutzt Ihre gesamte CPU-Leistung durch parallele Berechnungen, um den Suchbaum rasend schnell abzuschließen.
- **Visuelle Pfadhervorhebung**: Fahren Sie mit der Maus über ein Ergebniswort, um den Weg auf dem Raster nachzuzeichnen, oder klicken Sie darauf, um ihn dauerhaft zu fixieren. Wenn Sie einen Buchstaben tauschen müssen, wird er mit einem Sternchen `*` markiert.
- **Internationalisierung**: UI unterstützt dynamisch Englisch, Französisch, Deutsch und Spanisch.

## 🚀 Warum ist dieser Solver so schnell?

Im Gegensatz zu klassischen Ansätzen, die das Feld blind absuchen, integriert dieser Solver zwei Optimierungsebenen, wodurch er bis zu 3 Joker in unter 30 Sekunden verarbeiten kann:

1. **Globaler Kompatibilitätsfilter**: Bevor überhaupt nach einem physischen Weg auf dem 5x5-Raster gesucht wird, prüft der Algorithmus mithilfe eines Frequenzzählers, ob die benötigten Buchstaben (unter Berücksichtigung der Joker) überhaupt auf dem Feld vorhanden sind. Diese blitzschnelle Prüfung verwirft sofort über 99 % des Wörterbuchs, ohne komplexe geometrische Berechnungen durchzuführen.
2. **Optimierte Pfadsuche (DFS & Bitmasking)**: Für die verbleibenden Wörter wird der exakte Pfad über eine Tiefensuche (DFS) verifiziert. Die Zustandshistorie wird dynamisch zwischengespeichert (`lru_cache`) und Gitterpositionen werden als Bitmasken codiert, um redundante Pfadberechnungen zu vermeiden.
3. **Multithread-Architektur**: Das Wörterbuch wird in Abschnitte unterteilt und gleichzeitig auf alle CPU-Kerne verteilt. Diese Lastenverteilung umgeht die klassischen Python-Einschränkungen (GIL) und teilt die Gesamtrechenzeit effektiv durch die Anzahl Ihrer Prozessorkerne.

## Installation & Start

### Die einfache Methode
1. Stellen Sie sicher, dass **Python 3.10+** installiert ist.
2. Klonen oder laden Sie dieses Repository herunter.
3. Starten Sie die Anwendung:
   - **Windows**: Doppelklicken Sie einfach auf **`start.bat`**.
   - **macOS**: Doppelklicken Sie auf **`start_mac.command`**. *(Hinweis: Möglicherweise müssen Sie zunächst Ausführungsrechte erteilen, indem Sie mit der rechten Maustaste klicken > "Öffnen", oder über das Terminal `chmod +x start_mac.command`)*.
   - **Linux**: Führen Sie **`start_linux.sh`** in Ihrem Terminal aus oder doppelklicken Sie darauf, wenn Ihr Dateimanager dies unterstützt.

   *Das Skript richtet automatisch die virtuelle Umgebung ein, installiert die Abhängigkeiten und startet die Anwendung!*

### Die manuelle Methode (Alle Betriebssysteme)
1. Stellen Sie sicher, dass **Python 3.10+** installiert ist.
2. Es wird dringend empfohlen, eine virtuelle Umgebung zu verwenden:
   ```bash
   python -m venv .venv
   .\.venv\Scripts\activate  # Windows
   ```
3. Installieren Sie die Abhängigkeiten:
   ```bash
   pip install -r requirements.txt
   ```

## Bedienung
Starten Sie die Benutzeroberfläche über `start.bat` (Windows) oder manuell:
```bash
python solver/main.py
```
Füllen Sie die Buchstaben aus, wählen Sie Ihre Multiplikatoren und geben Sie an, wie viele Threads Sie verwenden möchten. Klicken Sie auf **"Wörter finden!"** 

## Lizenz
Dieses Projekt ist unter der **MIT-Lizenz** lizenziert. Es steht Ihnen frei, diese Software zu kopieren, zu verändern und zu verbreiten, vorausgesetzt, Sie fügen den ursprünglichen Urheberrechtshinweis hinzu und geben den Ersteller an. Weitere Details finden Sie in der `LICENSE`-Datei.
