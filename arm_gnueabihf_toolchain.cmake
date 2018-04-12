## @file        arm_gnueabihf_toolchain.cmake
## @licence     AGPL

# cmake toolchain file for opencog cross compile to arm7l
# to be used by https://github.com/opencog/ocpkg/blob/master/octool_rpi.sh

SET(CMAKE_SYSTEM_NAME Linux)

SET(CC_TC_DIR $ENV{CC_TC_DIR})
SET(DEPS_DIR $ENV{CC_TC_LIBS_PATH_2})

SET(INSTALLED_DEPS_DIR $ENV{CC_TC_LIBS_PATH_1})
SET(INSTALL_DIR ${INSTALLED_DEPS_DIR}/usr/local)

SET(CMAKE_C_COMPILER arm-linux-gnueabihf-gcc)
SET(CMAKE_CXX_COMPILER arm-linux-gnueabihf-g++)

SET(CMAKE_FIND_ROOT_PATH ${DEPS_DIR} ${INSTALLED_DEPS_DIR})
SET(CMAKE_INSTALL_PREFIX ${INSTALL_DIR})

SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
