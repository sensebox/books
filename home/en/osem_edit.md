# Modifying a station
All properties of a station may be changed after the registration.

To do this, authorization with the **API-key** is required, which was sent to you in the registration e-mail!



1. Select your station on the map by clicking on the marker on the map.

2. Select the tab "Info" in the sidebar and click "Manage".

3. Enter your API-key in the dialog.
    <img src="https://raw.githubusercontent.com/sensebox/resources/master/images/osem_edit_api-key.jpg" center width="600px" />

4. Make your desired changes in the appearing form.
    You may edit metadata, geolocation, photo, as well as the stations sensor configuration.

    > ***Hint:*** *If you have added a new sensor and want to download the updated arduino-sketch, a page-reload after saving is required.*

5. Click "save" or "cancel" in the top of the dialog to apply or discard your changes.

## Deleting a station
Follow the steps under ["Modifying a station"](#modifying-a-station), then type `DELETE` in the textfield "Delete senseBox" and confirm.

> ***warning:*** *All associated sensor data will be permanently deleted!*
