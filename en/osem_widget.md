# openSenseMap Widget
To display the data of a senseBox not only on `opensensemap.org`, but for example also on your own website, you may use our widget.


## Example

<iframe
  src="https://sensebox.github.io/opensensemap-widget/iframe.html?senseboxId=570bad2b45fd40c8197f13a2"
  width="400"
  height="666"
  marginwidth="8" marginheight="8"
  hspace="0" vspace="0"
  frameborder="0"
  scrolling="no"
></iframe>

## Usage
To include the widget, you just need to add an `iframe` to your page.

### Step 1: Find your senseBox ID
Go to [https://opensensemap.org/](https://opensensemap.org/) and open a senseBox of your choice. Now copy the last portion of the address bar of your browser. This is your senseBox ID.

### Step 2: Insert HTML into your page
In order to include the widget into your web page, just include the following html into your page at the desired location.

Replace the `YOUR-SENSEBOX-ID` in the `src` attribute with the senseBox ID from step 1.
```html
<iframe
  src="https://sensebox.github.io/opensensemap-widget/iframe.html?senseboxId=YOUR-SENSEBOX-ID"
  width="400"
  height="600"
  marginwidth="8" marginheight="8"
  hspace="0" vspace="0"
  frameborder="0"
  scrolling="no"
></iframe>
```
You can play around with the `height` and `width` attributes.

You can find the source code of this widget on [GitHub](https://github.com/sensebox/opensensemap-widget).
