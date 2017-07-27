# opencog_rpi
Opencog Cross Compile Toolchain for Raspberry Pi3

This repo contains the compiler, needed libraries and script to
cross compile and install opencog on a RPI3 board. 

# Usage

## RPI Options

The first two options are meant to run on a RPI board running Raspbian. 

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
so it's best to run the following to first install the 
dependancies and then opencog. 
```
    ./octool_rpi.sh -do
```

## PC Options

The following two options are meant to run on a PC that is able
to compile opencog efficiently. 

The need for this cross compiler obviously is that it's very time
consuming to compile opencog on the RPI board. 

On PC, you should first download and setup the cross compiler toolchain.
This is a directory of files that contain the necessary include files and
ARM compiled libraries that will be needed during compilation and linking. 

The option ``` -t ``` downloads and arranges the files neeeded for 
cross compiling opencog. It gets the compiler, needed libraries and 
the opencog source code including cogutils, atomspace and opencog. 

The ``` -c ``` option, assumes the files are present on the expected 
folders of the PC. It will use the downloaded compiler to cross compile
opencog for RPI. 

If running the script for the first time, use the switches:
```
	./octool_rpi.sh -tc
```
This will download the cross compiler toolchain and compile opencog for RPI.
It will create a Debian package which you can easily take to your RPI board and
install. But remember to have  the base dependancies installed for the RPI first. 

