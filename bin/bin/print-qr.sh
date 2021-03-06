#!/usr/bin/env bash

######
#
# Script to print 2 factor auth secrets and qrs
#
# Requires libqrencode
# 
# Created by Rob Hernandez
#
######

DEPENDENCIES=( qrencode )

check_bin(){
  for dep in ${DEPENDENCIES[@]}; do
    if [ ! $(/usr/bin/which ${dep}) ];then
     echo "${dep} not installed"
     exit 1
    fi
  done
}

check_bin
echo -e "Enter in secret key:"
read SECRETKEY
echo -e "Enter in a key name (no spaces):"
read SECRETNAME

qrencode -t ANSI "otpauth://totp/${SECRETNAME}?secret=${SECRETKEY}"
