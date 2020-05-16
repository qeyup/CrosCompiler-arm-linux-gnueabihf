#!/bin/bash


# Download and extract gcc and get prerequisitos
wget http://ftpmirror.gnu.org/gcc/gcc-8.3.0/gcc-8.3.0.tar.gz
tar xf gcc-8.3.0.tar.gz
(
    cd gcc-8.3.0
    contrib/download_prerequisites
)


# Download glibc
wget http://ftpmirror.gnu.org/glibc/glibc-2.28.tar.xz
tar xf glibc-2.28.tar.xz
