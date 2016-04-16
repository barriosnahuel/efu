#!/bin/bash
# Created by Nahuel Barrios.
# Just comment the undesired software to skip installing specific software.


preInstallationLog "Transmission"
brew install transmission
postInstallationLog "Transmission"

logInfo "Download Mac Fans Control from: http://www.crystalidea.com/macs-fan-control"