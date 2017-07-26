# opencog_rpi
Opencog Cross Compile Toolchain for Raspberry Pi3

This repo contains the compiler, needed libraries and script to
cross compile and install opencog on a RPI3 board. 

#Usage

The octool_rpi.sh script handles most of the work for both 
cross compiling on a fancy machine and installing on a RPI 
running raspbian. 

The switches to the script:

```
Usage: octool_rpi.sh OPTION
Tool for installing necessary packages and preparing environment
for OpenCog on a Raspberry PI computer running Raspbian OS.
  -d   Install base/system dependancies.
  -o   Install OpenCog (precompilled: may be outdated)
  -t   Download and Install Cross-Compilling Toolchain
  -c   Cross Compile OpenCog (Run on PC!)
  -v   Verbose output
  -h   This help message
```


To install the base dependancies of opencog on the RPI,
use the ```-d``` switch. 

To install opencog with a debian package of pre-compiled 
binaries use the ```-o``` switch. This downloads a .deb
package and installs it on the system. 
It assumes that you have the base dependancies installed 
so it's best to run :
```
    ./octool_rpi.sh -do
```
This installs the dependancies and then opencog. 


