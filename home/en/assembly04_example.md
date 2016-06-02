>***Information:***
A custom casing for the senseBox:home is currently in development, but not yet available.
The setup shown here thus is just an examplary assembly.
With a bit of creativity, you can design a decent casing for your specific installation site!

# Exemplary setup
This hardware setup requires that the previous steps are completed, and the station is registered on the openSenseMap.

To set up the senseBox outdoors, a long ethernet cable, a Power-on-LAN (POE) adapter, and a weatherproof case is required.
Additionally the following tools are needed:

- hot glue
- drill
- screw-driver
- cable ties

## Casing
For requirements on the casing see the [first section of this guide](assembly01_inventory.html#additional-accessories-not-included-with-your-senseboxhome).
We use [this](https://raw.githubusercontent.com/sensebox/resources/master/datasheets/datasheet_case_FIBOX_piccolo_pc-d-85-t.pdf) case, which is available for order on [the manufacturer's webshop](http://de.farnell.com/fibox/pc-d-85-t/box-polycarbonat-ip67-deckel-klar/dp/1004124).

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/Fibox.jpg" align="center" width="400"/>

#### Cable routing

The combined power- and ethernet cable, as well as the long connection cable to the `HDC1008` temperature sensor is run through a 15mm wide hole, which we drill through the side of the case:

|||
|---|---|
|<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/bohrung_1.jpg" align="center" width="400"/>|<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/bohrung_2.jpg" align="center" width="400"/>|

#### Mounting the circuit board

To fix the main board into the casing, simply a few points of hotglue are required.
With a bit of pressure it should sit soon well within the case:

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/angeklebt.jpg" align="center" width="400"/>

#### Mounting the sensors

When attaching the sensors, make sure **no residues of adhesive** get onto the front side of the circuit board!

Both light-sensors (`VEML6070` and `TSL45315`) are placed on top of the senseBox shield, as they require an unobstructed view to the transparent case-top.
Make sure they are not covered by cables later on!

|||
|---|---|
|<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/sensor_ankleben_1.jpg" align="center" width="400"/>|<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/sensor_ankleben_2.jpg" align="center" width="400"/>|

The air-pressure sensor (`BMP280`) is placed on the side of the case:

|||
|---|---|
|<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/luftdruck_ankleben_1.jpg" align="center" width="400"/>|<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/luftdruck_ankleben_2.jpg" align="center" width="400"/>|


#### Mounting the temperature sensor
Air-pressure and -temperature are affected by the wasteheat of the microcontroller.
Thus a separate housing (see below) for the `HDC1008` is required, that has a better airflow, but still protects the sensor from rainwater.
We use the long connection cable for this sensor and route it through the drilled hole:

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/temp_aussen.jpg" align="center" width="400"/>

#### Power and network connection
To provide the station with power, we use a POE-adapter as it uses up less space in the drilling hole.
The usual power connection may be used instead of course.

The adapter is connected to the respective connections on the main boards.
Afterwards we route an ethernet cable into the case and connect it to the adapter:

|||
|---|---|
|<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/POE_1.jpg" align="center" width="400"/>|<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/POE_2.jpg" align="center" width="400"/> |

Now we are done with the casing and it may be closed!

#### Casing for the `HDC1008`
To make the placement of the temperature sensor weatherproof, we 3D-printed a small separate casing:

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/temp_gehaeuse.jpg" align="center" width="400"/>

After sliding the sensor board in and closing the lid, we attach the case onto the main FIBOX case with hotglue.

#### Seal the case
At last we need to make sure that no water gets into the case.
Once again we use our hot glue, and seal the drilled hole:

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/abdichten.jpg" align="center" width="400"/>

#### Final result
For the installation we attach the second piece of the POE-adapter to the ethernet cable, and connect the senseBox to the network and power supply.

done!

|||
|---|---|
|<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/endergebnis.jpg" align="center" width="400"/>|<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/mario_sensebox.jpeg" align="center" width="400"/>|

> ***hint:*** Look for a location for the station, which ideally is directly exposed to the sky and is unobstructed in its surroundings

> ***warning!*** you need to place the power plug outdoors, absolutely use a weatherproof junction box!
