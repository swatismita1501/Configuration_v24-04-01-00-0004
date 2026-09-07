# Configuration

The configuration for ARC in the early alpha stages continues to evolve as it is modernized and many of the legacy or unsupported configurations are removed.  While there is still a long way to go this file outlines the steps required to adjust the ARC configuration for P2PE specifically compared to the previous alpha.

At this time ARC requires SPS service 1.8.3 and signed ArcSec.json configuration apk files.  Additionally, your devices must be injected with the correct keys in the correct locations otherwise encryption will fail.  For questions and assistance with key injection please contact your Ingenico representative.

## SPS Configuration

**Before downloading latest ARC application, any old SPS config must first be deleted**.  The SPS configuration will show in AxToolkit's Software Manager's app list as module `"com.ingenico.ingp.secure.spsconfig"`.

Uninstall this APK **before** proceeding. Latest ARC application does NOT require any SPS configuration. 

## ARC Configuration

ARC is configured by downloading a signed APK including the `ArcSec.json` file.  The APK is downloaded via the 62 command in the EFT protocol.  The new configuration will be effective without a reboot.

## Provided Configurations

Configurations for ARC are provided for the following options:

 - No P2PE or no Encryption
 - OnGuard FPE
 - OnGuard SDE
 - Voltage TEP2
 - Voltage TEP4
 - Voltage TEP6
 - Voltage TEP7
 - RSA OAEP

!!! warning "Configurations Provided"
    The configurations provided are for development devices only and will not work on production or non-configured devices.

### No P2PE

To disable P2PE the contents of the `No Encryption` folder should be used.  The SPS configuration APK should be first uninstalled from the existing device (if it was ever loaded) by using the AxToolKit.

Then use RBA Test App or some other application to download the `No Encryption/ArcNoEncryption.apk` to the device.

!!! warning "Downloading the `ArcNoEncryption.apk`"
    Do not use the AxToolKit to download and install the `ArcNoEncryption.apk`.  Additionally, when writing the `ArcNoEncryption.apk` to the Axium device using the 62 message do not change the file name as this will cause an unpacking issue.

### OnGuard FPE

To enable OnGuard FPE encryption the contents of the `OnGuard FPE` should be used.  The SPS configuration APK should be first uninstalled from the existing device (if it was ever loaded) by using the AxToolKit.

Then use RBA Test App or some other application to download the `OnGuard FPE/ArcOnGuardFPE.apk` to the device.

Finally, `OnGuard FPE/MockKeys.txt` file should be loaded to the SDCard of the Axium device (i.e. use Android Studio to upload the file).  Once that is done the user can launch the Mock Key Injection application on the device and request for the keys to be injected.

### OnGuard SDE

To enable OnGuard FPE encryption the contents of the `OnGuard SDE` should be used.  The SPS configuration APK should be first uninstalled from the existing device (if it was ever loaded) by using the AxToolKit.

Then use RBA Test App or some other application to download the `OnGuard SDE/ArcOnGuardSDE.apk` to the device.

Finally, `OnGuard SDE/MockKeys.txt` file should be loaded to the SDCard of the Axium device (i.e. use Android Studio to upload the file).  Once that is done the user can launch the Mock Key Injection application on the device and request for the keys to be injected.

### Voltage TEP2

To enable Voltage TEP2 encryption the contents of the `Voltage TEP2` should be used.  The SPS configuration APK should be first uninstalled from the existing device (if it was ever loaded) by using the AxToolKit.

Then use RBA Test App or some other application to download the `Voltage TEP2/voltageTEP2.apk` to the device.


### Voltage TEP4

To enable Voltage TEP2 encryption the contents of the `Voltage TEP4` should be used.  The SPS configuration APK should be first uninstalled from the existing device (if it was ever loaded) by using the AxToolKit.

Then use RBA Test App or some other application to download the `Voltage TEP4/voltageTEP4.apk` to the device.

### Voltage TEP6

To enable Voltage TEP2 encryption the contents of the `Voltage TEP6` should be used.  The SPS configuration APK should be first uninstalled from the existing device (if it was ever loaded) by using the AxToolKit.

Then use RBA Test App or some other application to download the `Voltage TEP6/voltageTEP6.apk` to the device.

### Voltage TEP7

To enable Voltage TEP2 encryption the contents of the `Voltage TEP7` should be used.  The SPS configuration APK should be first uninstalled from the existing device (if it was ever loaded) by using the AxToolKit.

Then use RBA Test App or some other application to download the `Voltage TEP7/voltageTEP7.apk` to the device.


### RSA OAEP

To enable RSA-OAEP encryption the contents of the `RSA OAEP` should be used.  The SPS configuration APK should be first uninstalled from the existing device (if it was ever loaded) by using the AxToolKit.

Then use RBA Test App or some other application to download the `RSA OAEP/RSA.apk` to the device.

