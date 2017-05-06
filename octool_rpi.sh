#/bin/bash
#
## @file        octool_rpi


#Octool for Raspbian OS

#CONSTANTS

set -e

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

SELF_NAME=$(basename $0)
TOOL_NAME=octool_rpi



usage() {
  echo "Usage: $SELF_NAME OPTION"
  echo "Tool for installing necessary packages and preparing environment"
  echo "for OpenCog on a Raspberry PI computer running Raspbian OS."
  echo "  -d   Install base/system dependancies."
  echo "  -o   Install OpenCog (precompilled - may be outdated)"
  echo "  -c   Cross Compile OpenCog (Run on PC!)"
  echo "  -v   Verbose output"
  echo -e "  -h   This help message\n"
}




if [ $# -eq 0 ] ; then 
  echo "ERROR!! Please specify what to do\n"
  usage
else
  while getopts "docvh:" switch ; do
    case $switch in
      d)    INSTALL_DEPS=true ;;
      o)    INSTALL_OC=true ;;
      c)    CC_OPENCOG=true ;;
      v)    SHOW_VERBOSE=true ;;
      h)    usage ;;
      ?)    usage ;;
      *)    echo -e "ERROR!! UNKNOWN ARGUMENT!!\n" usage ;;
    esac
  done
fi


if [ $SHOW_VERBOSE ] ; then
	echo "I will be verbose"
	APT_ARGS=" -V "
else
	APT_ARGS=" -qq "
fi

if [ $INSTALL_DEPS ] ; then 
	echo "Install Deps"
	#if [ $(uname -p) == "ARM" ] ; then
		#only allow installation for arm device (RPI)
	#fi
	sudo apt-get install -y $APT_ARGS $INSTALL_PACKAGES

	#download and compile TBB

fi

if [ $INSTALL_OC ] ; then 
	echo "Get Compiled files from somewhere"
fi

if [ $CC_OPENCOG ] ; then
	echo "Cross Compile OpenCog"
	#check if running on ubuntu with x86_64 PC
	#before compiling
fi
