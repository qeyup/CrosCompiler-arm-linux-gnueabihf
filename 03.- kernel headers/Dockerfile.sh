#!/bin/bash


# Download and extract kernel source
wget https://mirrors.edge.kernel.org/pub/linux/kernel/v4.x/linux-4.8.16.tar.xz
tar -xf linux-4.8.16.tar.xz


# Build kernel headers
cd linux-4.8.16
make ARCH=$MAKE_ARCH INSTALL_HDR_PATH=$CROSS_SYSROOT headers_install


# Make sysroot dir structure
#mkdir -p $CROSS_SYSROOT/lib
#mkdir -p $CROSS_SYSROOT/include
#mkdir -p $CROSS_SYSROOT/usr/lib
#mkdir -p $CROSS_SYSROOT/usr/include
#mkdir -p $CROSS_SYSROOT/usr/local/lib
#mkdir -p $CROSS_SYSROOT/usr/local/include
