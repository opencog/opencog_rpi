#/bin/bash
#
## @file        octool_rpi
## @author      Dagim Sisay <dagiopia@gmail.com>


#Octool for Raspbian OS

#CONSTANTS

set -e

GOOD_COLOR='\033[32m'  #GREEN
OKAY_COLOR='\033[33m'  #YELLOW
BAD_COLOR='\033[31m'   #RED
NORMAL_COLOR='\033[0m'

INSTALL_PACKAGES="
	build-essential \
	cmake \
	rlwrap \
	guile-2.0-dev \
	libiberty-dev \
	libicu-dev \
	libbz2-dev \
	cython \
	python-dev \
	python-zmq \
	python-simplejson \
	libboost-date-time-dev \
	libboost-filesystem-dev \
	libboost-math-dev \
	libboost-program-options-dev \
	libboost-regex-dev \
	libboost-serialization-dev \
	libboost-thread-dev \
	libboost-system-dev \
	libboost-random-dev \
	libjson-spirit-dev \
	libzmq3-dev \
	binutils-dev \
	unixodbc-dev \
	libpq-dev \
	uuid-dev \
	libprotoc-dev \
	protobuf-compiler \
	libssl-dev \
	tcl-dev \
	tcsh \
	libfreetype6-dev \
	libatlas-base-dev \
	gfortran \
	gearman \
	libgearman-dev \
	ccache \
	libgsasl7 \
	libldap2-dev \
	krb5-multidev "


INSTALL_CC_PACKAGES=" chrpath "


SELF_NAME=$(basename $0)
TOOL_NAME=octool_rpi

CC_TC_DIR="RPI_OC_TC" #RPI Opencog Toolchain Container

usage() {
  echo "Usage: $SELF_NAME OPTION"
  echo "Tool for installing necessary packages and preparing environment"
  echo "for OpenCog on a Raspberry PI computer running Raspbian OS."
  echo "  -d   Install base/system dependancies."
  echo "  -o   Install OpenCog (precompilled: may be outdated)"
  echo "  -t   Download and Install Cross-Compilling Toolchain"
  echo "  -c   Cross Compile OpenCog (Run on PC!)"
  echo "  -v   Verbose output"
  echo -e "  -h   This help message\n"
}


download_install_oc () {
	wget 144.76.153.5/opencog/opencog_rpi.deb
	sudo dpkg -i opencog_rpi.deb
	rm opencog_rpi.deb
}

setup_sys_for_cc () {
    #downloading cogutils, atomspace and opencog source code
    mkdir -p /home/$USER/$CC_TC_DIR/opencog
    cd /home/$USER/$CC_TC_DIR/opencog
    rm -rf  *
    wget https://github.com/opencog/cogutils/archive/master.tar.gz
    tar -xvf master.tar.gz
    rm master.tar.gz
    wget https://github.com/opencog/atomspace/archive/master.tar.gz
    tar -xvf master.tar.gz
    rm master.tar.gz
    wget https://github.com/opencog/opencog/archive/master.tar.gz
    tar -xvf master.tar.gz
    rm master.tar.gz
    wget https://raw.githubusercontent.com/Dagiopia/cogutils/rpi/arm_gnueabihf_toolchain.cmake
    for d in * ; do mkdir $i/build_hf ; done
    cd /home/$USER/$CC_TC_DIR
    #downloading compiler and libraries
    wget 144.76.153.5/opencog/opencog_rpi_toolchain.tar.gz 
    tar -xvf opencog_rpi_toolchain.tar.gz
    rm opencog_rpi_toolchain.tar.gz
}

do_cc_for_rpi () {
    export PATH=$PATH:/home/$USER/$CC_TC_DIR/opencog_rpi_toolchain/tools-master/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/bin
    #compiling cogutils
    cd /home/$USER/$CC_TC_DIR/opencog/cogutils/build_hf
    cmake -DCMAKE_TOOLCHAIN_FILE=/home/$USER/$CC_TC_DIR/opencog/arm_gnueabihf_toolchain.cmake -DCMAKE_INSTALL_PREFIX=/home/$USER/$CC_TC_DIR/opencog_rasp/usr/local -DCMAKE_BUILD_TYPE=Release ..
    make $(nproc)
    make install 

    #compiling atomspace
    cd /home/$USER/$CC_TC_DIR/opencog/atomspace/build_hf
    cmake -DCMAKE_TOOLCHAIN_FILE=/home/$USER/$CC_TC_DIR/opencog/arm_gnueabihf_toolchain.cmake -DCMAKE_INSTALL_PREFIX=/home/$USER/$CC_TC_DIR/opencog_rasp/usr/local -DCMAKE_BUILD_TYPE=Release ..
    make $(nproc)
    make install

    #compiling opencog
    cd /home/$USER/$CC_TC_DIR/opencog/opencog/build_hf
    cmake -DCMAKE_TOOLCHAIN_FILE=/home/$USER/$CC_TC_DIR/opencog/arm_gnueabihf_toolchain.cmake -DCMAKE_INSTALL_PREFIX=/home/$USER/$CC_TC_DIR/opencog_rasp/usr/local -DCMAKE_BUILD_TYPE=Release ..
    make $(nproc)
    make install
    
    #correct RPATHS
    cd /home/$USER/$TC_CC_DIR/
    wget https://raw.githubusercontent.com/Dagiopia/my_helpers/master/batch_chrpath/batch_chrpath.py
    python batch_chrpath.py /home/$USER/$TC_CC_DIR/opencog_rasp/usr/local /home/$USER/$TC_CC_DIR/opencog_rpi_toolchain/needed_libs /home/$USER/$TC_CC_DIR/opencog_rpi_toolchain/opencog_rasp
    rm batch_chrpath.py

    #package into deb
}



if [ $# -eq 0 ] ; then 
  printf "${BAD_COLOR}ERROR!! Please specify what to do\n${NORMAL_COLOR}"
  usage
else
  while getopts "dotcvh:" switch ; do
    case $switch in
      d)    INSTALL_DEPS=true ;;
      o)    INSTALL_OC=true ;;
      t)    INSTALL_TC=true ;;
      c)    CC_OPENCOG=true ;;
      v)    SHOW_VERBOSE=true ;;
      h)    usage ;;
      ?)    usage ;;
      *)    printf "ERROR!! UNKNOWN ARGUMENT!!\n" usage ;;
    esac
  done
fi


if [ $SHOW_VERBOSE ] ; then
	printf "${OKAY_COLOR}I will be verbose${NORMAL_COLOR}\n"
	APT_ARGS=" -V "
else
	APT_ARGS=" -qq "
fi

if [ $INSTALL_DEPS ] ; then 
	echo "Install Deps"

	if [ $(uname -m) == "armv7l" ] ; then
		printf "${GOOD_COLOR}okay it's an ARM... Installing packages${NORMAL_COLOR}\n"
		#only allow installation for arm device (RPI)
	        sudo apt-get install -y $APT_ARGS $INSTALL_PACKAGES

	else
		printf "${BAD_COLOR}Your Machine is Not ARM! The dependancy installation is for RPI only.${NORMAL_COLOR}"
	fi
	#download and compile TBB

fi

if [ $INSTALL_OC ] ; then 
	echo "Get Compiled files from somewhere"
        download_install_oc
fi

if [ $INSTALL_TC ] ; then 
	echo "Downloading Necessary CC Packages"
	#make the appropriate directories and git clone the toolchain
	setup_sys_for_cc
fi

if [ $CC_OPENCOG ] ; then
	echo "Cross Compile OpenCog"
	#check if running on ubuntu with x86_64 PC
	if [ $(uname -m) == "x86_64" ] ; then
		printf "${GOOD_COLOR}okay it's an x86_64 PC... Installing CC packages${NORMAL_COLOR}\n"
		PROCEED_CC=true
	        sudo apt-get install -y $APT_ARGS $INSTALL_CC_PACKAGES
		do_cc_for_rpi
	else
		printf "${BAD_COLOR}Your Machine is ARM! Let's Cross Compile on a bigger machine.${NORMAL_COLOR}"
	fi
fi
