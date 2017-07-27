SET(CMAKE_SYSTEM_NAME Linux)

SET(CMAKE_C_COMPILER arm-linux-gnueabihf-gcc)
SET(CMAKE_CXX_COMPILER arm-linux-gnueabihf-g++)


SET(CMAKE_FIND_ROOT_PATH /home/$ENV{USER}/$ENV{CC_TC_DIR}/opencog_rpi_toolchain/needed_libs /home/$ENV{USER}/RPI/opencog_rpi_toolchain/opencog_rasp)

SET(CMAKE_INSTALL_PREFIX /home/$ENV{USER}/$ENV{CC_TC_DIR}/opencog_rpi_toolchain/opencog_rasp/usr/local)

SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)

