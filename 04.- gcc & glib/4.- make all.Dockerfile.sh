#!/bin/bash


# Compiler Support Library
(
    cd build-gcc
    make -j$(nproc --all) all-target-libgcc
    make install-target-libgcc
)


# Standard C Library
(
    cd build-glibc
    make -j$(nproc --all)
    make install
)


# Standard C++ Library
(
    cd build-gcc
    make -j$(nproc --all)
    make install
)


# Fix GNU ld script for libc.so (remove absolute path)
sed -i -e "s@${CROSS_SYSROOT}/lib/@@g" $CROSS_SYSROOT/lib/libc.so
