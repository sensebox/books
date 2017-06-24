# Register a Luftdaten.info Particulate Matter Sensor on the openSenseMap
You can send the data of your particulate matter sensor to the openSenseMap if you follow these steps.

## 1. Look up your sensor configuration and [register](https://opensensemap.org/register) a new senseBox
- Using the web interface of your device, you can find out which sensors are attached ([Fig. 1](#figure-1-webinterface-particualte-matter-sensor)).
- Go to [https://opensensemap.org/register](https://opensensemap.org/register), fill out your name, location and exposure.
- In the section **Hardware** select **luftdaten.info**. Now select the correct sensor configuration matching your local sensor configuration ([Fig. 2](#figurre-2-registration-on-opensensemap)).
- Finish the registration.
- **Attention:** Copy your senseBox ID. This is a 24 character long string looking like this: *58a88c6b650831d8a3625e01*
- If you registered with a correct mail address, the senseBox ID will also be sent via mail.

## 2. Configure your device
- Go to the web interface of your device
- Open the configuration page
- Paste your senseBox ID in the field next to **Send to openSenseMap** and check the box.
- Save the configuration with the button on the bottom of the page.

## Done
Your device should now send its data to the openSenseMap!

## Figure 1: Webinterface particulate matter sensor
<img src="https://github.com/sensebox/resources/raw/master/images/luftdaten/02_Sensor_Konfiguration.png"/>

## Figure 2: Registration on openSenseMap
<img src="https://github.com/sensebox/resources/raw/master/images/luftdaten/01_openSenseMap_Konfiguration.png"/>
