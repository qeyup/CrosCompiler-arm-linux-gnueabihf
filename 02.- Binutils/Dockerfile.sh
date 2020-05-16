#!/bin/bash


# Download and extract
wget http://ftp.rediris.es/mirror/GNU/binutils/binutils-2.31.tar.gz
tar xf binutils-2.31.tar.gz

# Build
mkdir build-binutils
cd build-binutils


# Set configuration ()
OPTIONS=()

# Set install prefix
OPTIONS+=(--prefix=$CROSS_COMPILER_PREFIX)

# Disable -Werror in bootstrap stage2 and later
OPTIONS+=(--disable-werror)

# Configure for building compilers for TARGET [HOST]
OPTIONS+=(--target=$CONFIG_CROSS_TARGET)

# Do not use Native Language Support
OPTIONS+=(--disable-nls)

# not valid
#OPTIONS+=(--with-sysroot=$CROSS_SYSROOT)
#OPTIONS+=(--with-arch=$ARM_VERSION)
#OPTIONS+=(--with-float=$ARM_FLOAT_TYPE)
#OPTIONS+=(-with-fpu=vfp)


# Build steps
../binutils-2.31/configure ${OPTIONS[@]}
make -j$(nproc --all)
make install
