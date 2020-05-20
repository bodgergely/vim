#!/usr/bin/env bash
if [[ -z $1 ]]; then
   echo Provide the install path! 
   exit -1
fi
./neovim-build.sh debug $1
