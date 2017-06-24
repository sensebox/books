# openSenseMap Widget
Um die Sensordaten einer senseBox nicht nur auf `opensensemap.org` anzuzeigen, sondern beispielsweise auch in eine eigene Website einzubinden
kann das *openSenseMap Widget* verwendet werden.

## Beispiel

<iframe
  src="https://sensebox.github.io/opensensemap-widget/iframe.html?senseboxId=570bad2b45fd40c8197f13a2"
  width="400"
  height="666"
  marginwidth="8" marginheight="8"
  hspace="0" vspace="0"
  frameborder="0"
  scrolling="no"
></iframe>

## Anleitung
Dieses Widget kann in eine Seite eingebunden werden und zeigt dann dort Informationen zu einer ausgewählten,
auf der openSenseMap registrierten senseBox an. Um das Widget einzubinden, muss man einfach folgende Codezeilen
in sein HTML-Element einfügen:

```html
<iframe
  src="https://sensebox.github.io/opensensemap-widget/iframe.html?senseboxId=DEINE-SENSEBOXID"
  width="400"
  height="600"
  marginwidth="8" marginheight="8"
  hspace="0" vspace="0"
  frameborder="0"
  scrolling="no"
></iframe>
```

In der URL muss `DEINE-SENSEBOXID` durch die ID deiner Box ersetzt werden, wie sie auch in der OpenSenseMap
gespeichert ist. Anschließend ist das Widget sofort auf der Seite verfügbar.
Die Größe lässt sich über die `width` und `heigth` Attribute anpassen.

Der Quellcode ist auf GitHub unter [sensebox/opensensemap-widget](https://github.com/sensebox/opensensemap-widget) zu finden.
