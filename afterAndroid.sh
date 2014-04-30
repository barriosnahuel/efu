#!/bin/sh

#   TODO : Add environment variables.

#   TODO : Download at least the latest platform API.

#Enable Android applications testing on HTC devices. See: http://developer.android.com/tools/device.html#setting-up
echo 'Enabling testing Android apps on HTC devices...'

sudo echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="0bb4", MODE="0666", GROUP="plugdev"' >> /etc/udev/rules.d/52-android.rules
chmod a+r /etc/udev/rules.d/51-android.rules
