# Software installation

To program the Arduino, you need to install the Arduino IDE and drivers. Depending on your OS, there are different ways to install the software.

You can find the latest installation files [here](http://arduino.cc/en/Main/Software).

## Installation on  **Windows**

After downloading the Arduino installation file, you just need to run it by double clicking on it. Follow the instructions in the setup menu.

### Installation of the drivers on Windows XP/Vista/7

After installing the Arduino software, the main drivers will be installed on your computer. The software can have problems, however, with detecting the right driver for the connected board. You need to do the following steps:

1. Connect the Arduino UNO to your computer with the USB cable

2. The computer tries to detect and install the correct driver. This does not always work properly. We need to install the driver manually.

3. Open system preferences (Start → System preferences)

4. Go to System and Secruity → System → Device Manager

5. Search for Arduino UNO / Genuino UNO or unknown device. Right-click on it and choose the option to install driver software manually.

6. Search driver software on the computer and choose the folder for the arduino software. In this folder, there is the folder Driver. Choose this folder and confirm your selection.

7. Windows will install the correct driver and your Arduino UNO should work properly.


## Installation on **macOS**

After downloading the files (see above) you can install them and copy them to your applications folder. It is not necessary to install drivers on macOS.

## Installation on **Linux**

After downloading the files (see above) you need to extract the `.tar.xz` archive.
You can run the installation script `install.sh` with the following command from the teminal:

```
cd <path to extracted folder>
./install.sh
```
In a desktop environment you can start the installation with a double-click on the `install.sh` file.

Afterwards there will appear a shortcut to run the Arduino IDE.
