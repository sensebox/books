# Eigene Projekte beitragen

Wenn ihr ein eigenes Projekt selbst entwickelt und die Entwicklung dokumentiert habt, fügen wir eure Anleitung gerne zu diesem Buch hinzu!

Die Dokumentation sollte einen Überblick über das Projekt geben, und eine Schritt-für-Schritt Anleitung zum Nachbau enthalten.
Fotos und Programmcode können ebenfalls hinzugefügt werden!

Für die Bearbeitung und Verwaltung dieses Buches verwenden wir [github.com](https://github.com) und das Tool [GitBook](https://www.gitbook.com/), alle Inhalte werden in [Markdown](http://whatismarkdown.com/) geschrieben.

Nicht nur eigene Inhalte, auch Korrekturen & Verbesserungen am bestehenden Inhalt sind gern gesehen ;)

## Schreiben der Dokumentation
Die Dokumentation sollte im Markdown-Format verfasst sein, sodass der Inhalt direkt in das Buch eingearbeitet werden kann. Falls ihr nicht vertraut mit Markdown seid, findet ihr [hier](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) eine Hilfestellung und Syntaxerläuterung.

Um das Schreiben mit Markdown zu vereinfachen gibt es übrigens auch online-Editoren wie [stackedit](https://stackedit.io/editor).

### Inhalt
Sofern sie für euer Projekt geeignet ist, könnt ihr euch an dieser <a href="./community_projekte/projekt_vorlage.md" target="_blank">**Vorlage**</a> für Anleitungen orientieren.

In jedem Fall sollten alle Informationen enthalten sein, sodass das Projekt von anderen wiederholt werden kann!

### Dateinamen
Achtet darauf, dass in den Dateinamen keine Leerzeichen enthalten sind!
Wenn Bilder oder andere Dateien (zB. Arduino-Sketches) eingebunden werden sollen, legt diese einfach im selben Ordner mit dem Projektnamen im Dateinamen ab:

```
mobile-wetterstation.md
mobile-wetterstation-uebersicht.jpg
mobile-wetterstation.ino
```

## Hochladen der Dokumentation
Um uns die Dokumentation zuzusenden, fügt ihr diese am besten in das Buch selber ein.

Der Quellcode dieses Buches ist [hier](https://github.com/sensebox/books) auf GitHub zu finden.
**Forkt dazu dieses Repository, fügt eure Inhalte dort ein, und erstellt dann einen Pullrequest.**

Falls ihr mit git nicht vertraut seid, erfahrt ihr nun im Detail wie das alles funktioniert.
Wenn Fragen offen bleiben, stehen wir euch auch gerne [per Mail](mailto:support@sensebox.de) zur Verfügung.

### GitHub Account erstellen
Um eigene Beiträge auf GitHub zu erstellen wird dort ein Account benötigt.
Erstellt diesen [hier](https://github.com/register).
Das kostenlose Konto ist vollkommen ausreichend, da wir keine nicht-öffentlichen Repositories erstellen wollen.

GitHub ist ein Dienst, welcher git-Repositories online bereitstellt.
Ein *Repository* ist ein Verzeichnis für Code und Daten, welche inhaltlich zusammengehören.
Zu jedem Repository gehört eine Versions-Geschichte, über welche vorherige Versionen wiederhergestellt werden können.
Jede Version wird als *Commit* bezeichnet.

### Repository forken
Durch diese Versionsverwaltung können gleichzeitige Entwicklungsstränge dezentral entwickelt und wieder zusammengeführt werden; einen abgezweigten Entwicklungsstrang bezeichnet man *Fork* (engl. Gabelung).

Um unser Buch also weiter zu entwickeln, müsst ihr das Quelltext-Repository forken.
Besucht dazu die [Seite des Repositories](https://github.com/sensebox/books), und klickt den Button "Fork" oben rechts.

![github-fork](https://raw.githubusercontent.com/sensebox/resources/master/images/github-fork.jpg)

Das Repository wurde mit dem aktuellen Zustand zu eurem Account kopiert, und ist unter `https://github.com/<dein nutzername>/books` zu finden. Auf dieser Kopie habt ihr Schreibrechte, und könnt euren Inhalt einfügen!

### Repository clonen
Um die Dateien lokal vorliegen zu haben, kann man das Repository *clonen*.
Dazu benötigt ihr einen [git-Client](TODO) auf eurem Computer.

Kopiert die Adresse des Repositories und fügt sie in euren git-Client ein:

![github-clone-url](https://raw.githubusercontent.com/sensebox/resources/master/images/github-clone.jpg)

Ihr könnt diesen Schritt überspringen, und Dateien auf der Weboberfläche von GitHub anlegen und bearbeiten.
Dort ist es allerdings nur möglich je eine Datei auf einmal zu bearbeiten.

### Inhalt einfügen
Fügt eure Dateien in den Order `edu/de/community_projekte/` ein.

Falls ihr online auf GitHub arbeitet (`https://github.com/<dein nutername>/books/tree/master/edu/de/community_projekte`), könnt ihr über die Buttons "Upload files" und "Create New File" Bilder bzw Textdateien hochladen:

![github-add-file](https://raw.githubusercontent.com/sensebox/resources/master/images/github-add-files.jpg)

Zusätzlich könnt ihr die Projekt-Anleitung im Inhaltsverzeichnis (`edu/de/SUMMARY.md`) verlinken, hier ist ein Beispiel:

```md
...
* [Community-Projekte](community_projekte.md)
    * ...
    * [Mobile Wetterstation](community_projekte/mobile_wetterstation.md)

...
```

### Änderungen hochladen
Falls ihr lokal auf eurem Computer gearbeitet habt, muss der Code noch hochgeladen werden.
Andernfalls könnt ihr den Schritt überspringen.

Dazu muss zunächst ein neuer Commit erstellt werden, und dann die Änderungen *gepusht* werden.
Stellt sicher, dass ihr nur die Dateien in dem Verzeichnis liegen habt, welche ihr auch hinzufügen wollt.

Falls ihr den Kommandozeilen-Client verwendet, könnt ihr die folgenden Befehle nutzen:

```
git add *
git commit -m"KURZBESCHREIBUNG DER ÄNDERUNG"
git push
```

### Pullrequest erstellen
Nun da euer Inhalt online ist, könnt ihr uns benachrichtigen, dass ihr eure Änderung in unser Ursprungs-Repository einfügen wollt.
Erstellt dazu auf der GitHub-Weboberfläche von eurem geforkten Repository einen Pull Request.

![github-pullrequest](https://raw.githubusercontent.com/sensebox/resources/master/images/github-pullrequest.jpg)

Im Erscheinenden Fenster könnt ihr eine kurze Beschreibung eurer Änderung und weitere Kommentare angeben.

Wir werden nun über euren Beitrag informiert und uns eure Änderung ansehen.
In den nächsten Tagen solltet ihr eure Anleitung in diesem Buch im Kapitel [Community-Projekte](community_projekte.md) finden!


Alternativ zu dem Prozess auf GitHub gibt es auch den Gitbook.com online Editor, welcher euch einen Teil der Arbeit auf Github erspart.
Auch hier wird allerdings ein Github Account benötigt.

Falls all dies nicht funktioniert, könnt ihr die Anleitung im Markdown-Format gezippt an uns [per Mail](mailto:info@sensebox.de?subject=Projektanleitung senseBox:edu) senden.

**Vielen Dank für euren Beitrag!**
