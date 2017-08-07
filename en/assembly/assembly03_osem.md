# openSenseMap registration

Here the integration of your senseBox:home in our sensor network *openSenseMap* is described.
On this platform a registration is required, where you specify the exact setup of your box.

> ***hint:*** *you may change the OSeM website-language in the navbar!*

Register your senseBox by filling out the form [here](http://www.opensensemap.org/register).
During the registration you are asked for a hardware setup specification.
Choose *senseBox:home* and tick the *senseBox:home with (Ethernet)* or *senseBox:home (WiFi)* checkbox, depending on your edition.

Once the registration is completed, you will receive an email containing keys for your senseBox and sensors, as well as an custom arduino-sketch (see the file extension `.ino`) which you'll need to upload onto the microcontroller.

## Upload the sketch
Once you've downloaded the `sensebox.ino` attachment from the email, you need to upload the sketch onto the microcontroller, as was already described in [section 2](assembly02_software.md).
Here's a brief summary of the steps:

1. open the Arduino IDE
2. in the toolbar select `File` → `Open` and choose the downloaded `sensebox.ino` sketch
3. confirm the dialog with "yes"
4. upload the sketch onto the microcontroller using the **arrow** button

If nothing went wrong, you can now view your station on the openSenseMap (use the link in the email) and view your uploaded measurements!
