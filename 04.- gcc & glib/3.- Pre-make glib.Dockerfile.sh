#!/bin/bash


# Standard C Library Headers and Startup Files
mkdir -p build-glibc
cd build-glibc


# Set configuration
OPTIONS=()

# Set install prefix
OPTIONS+=(--prefix=$CROSS_SYSROOT)

# Configure cross compiler
OPTIONS+=(--build=$MACHTYPE)
OPTIONS+=(--host=$CONFIG_CROSS_TARGET)
OPTIONS+=(--target=$CONFIG_CROSS_TARGET)

# Specify which cpu variant the compiler should generate code for by default
OPTIONS+=(--with-arch=$ARM_VERSION)

# Specify Floating-point unit type
OPTIONS+=(--with-fpu=$ARM_FLOATING_POINT_UNIT_TYPE)

# Set float type
OPTIONS+=(--with-float=$ARM_FLOAT_TYPE)

# Specify that multiple target libraries to support different target variants is disable
OPTIONS+=(--disable-multilib)

# The libc_cv_forced_unwind=yes variable is passed in order to inform configure that force-unwind support is available without it having to run the test. 
OPTIONS+=(libc_cv_forced_unwind=yes)

# Build steps
../glibc-2.28/configure ${OPTIONS[@]}
make install-bootstrap-headers=yes install-headers
make -j$(nproc --all) csu/subdir_lib
install csu/crt1.o csu/crti.o csu/crtn.o $CROSS_SYSROOT/lib
${CONFIG_CROSS_TARGET}-gcc -nostdlib -nostartfiles -shared -x c /dev/null -o $CROSS_SYSROOT/lib/libc.so
touch $CROSS_SYSROOT/include/gnu/stubs.h
