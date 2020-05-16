#!/bin/bash


# Build C/C++ compilers


mkdir -p build-gcc
cd build-gcc


# Set configuration
OPTIONS=()

# Set install prefix
OPTIONS+=(--prefix=$CROSS_COMPILER_PREFIX)

# Configure target
OPTIONS+=(--target=$CONFIG_CROSS_TARGET)

# Specify that only a particular subset of compilers and their runtime libraries should be built. 
OPTIONS+=(--enable-languages=c,c++)

# Specify which cpu variant the compiler should generate code for by default
OPTIONS+=(--with-arch=$ARM_VERSION)

# Specify Floating-point unit type
OPTIONS+=(--with-fpu=$ARM_FLOATING_POINT_UNIT_TYPE)

# Set float type
OPTIONS+=(--with-float=$ARM_FLOAT_TYPE)

# Specify that multiple target libraries to support different target variants is disable
OPTIONS+=(--disable-multilib)

# Cmpiler will search that directory within dirname for native system headers rather than the default /usr/include
OPTIONS+=(--with-native-system-header-dir=/include)

# Set linux headers
#OPTIONS+=(--with-headers=$CROSS_SYSROOT/include/linux)
#OPTIONS+=(--with-headers=$CROSS_SYSROOT/include)
#OPTIONS+=(--with-build-sysroot=$CROSS_SYSROOT)

# Consider dir as the root of a tree that contains
OPTIONS+=(--with-sysroot=$CROSS_SYSROOT)


# Build steps
../gcc-8.3.0/configure ${OPTIONS[@]}
make -j$(nproc --all) all-gcc
make install-gcc

