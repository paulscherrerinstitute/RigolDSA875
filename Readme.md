# Overview
This is a device support for spectrum analyzer Rigol DSA875. It is based on a stream device sending SCPI commands using a TCP/IP interface.

Following functionality is currently supported:

 - Traces 1, 2 and 3  (mode control, pulling data)
 - Frequency and span control
 - Markers 1, 2 and 3 and their functionality of peak (frequencies with max power) selection and control
 - Reading errors from the error queue

> Trace 4 is a special type of trace, which can be only defined as mathematical combination of first 3 traces. It is not supported by this device support.

> Marker 4 is currently not supported, since provided caQtDM panel is only able to show 6 different items on the plot (3 traces + 3 markers).

# Usage
To add a device to the IOC, following must be added to the IOC's startup script: 

```
### Mandatory macros:
# SYS  -> System name PVprefix before column ( : )
# IP   -> IP address of the spectrum analyzer (@Nov 2016, No option to set a hostname on the Rigol DSA875)

### Optional macros:
# SCPI_PORT (default: 5555)  -> SCPI_PORT
# PORT (default: RIG1)       -> asyn port (if multiple devices used on one IOC, this must be different for each device)

require RigolDSA875, "IP=129.129.158.151,SYS=RIGOL1"
```

## Multiple devices on same IOC
```
require RigolDSA875, "IP=129.129.158.151,SYS=RIGOL1, PORT=RIG1"
runScript "$(RigolDSA875_DIR)/startup.cmd", "IP=129.129.158.152,SYS=RIGOL2, PORT=RIG2"
```

> Each device must have its own asyn port!

# GUI
This module comes with caQtDM panel supporting 3 traces and 3 markers. GUI files can be found in `./qt` folder. To start the panels on the PSI, flowing command must be executed:

```
startDM -noMsg -stylefile sfop.qss -macro SYS=SA-TST RigolDSA875_main.ui
```

# Dependencies
This device support depends on following EPICS modules
 - StreamDevice
