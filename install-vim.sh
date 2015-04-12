#!/bin/sh

if [ $# -ne 1 ]; then
  echo "usage: $0 VIM_VERSION"
  exit 1
fi

VERSION=$1
VIM_ARCHIVE=vim-$VERSION.tar.bz2
VIM_DIR=vim$(echo $VERSION | tr -d '.')
PREFIX_DIR=$HOME/usr/local
BINARY_DIR=$HOME/bin
TMP_DIR=$PWD/tmp

##
# Create directories if not exist.
mkdir -p $PREFIX_DIR
mkdir -p $BINARY_DIR

##
# Download vim.
cd $TMP_DIR
curl -L ftp://ftp.vim.org/pub/vim/unix/$VIM_ARCHIVE -O
tar xjf $VIM_ARCHIVE

##
# Configure and compile.
cd $VIM_DIR
./configure --prefix=$PREFIX_DIR
make

##
# Install
make install

##
# Create the symbolic link.
ln -s $PREFIX_DIR/bin/vim $BINARY_DIR/vim
