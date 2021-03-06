#!/bin/bash

PLATFORM=`/bin/uname`
case $PLATFORM in
  HP-UX)
    OS=HP-UX ;;
  AIX)
    OS=AIX ;;
  SunOS)
    OS=SunOS ;;
  Linux)
    if [ -s /etc/oracle-release ]; then
        OS=Oracle
    elif [ -s /etc/SuSE-release ]; then
        OS=SuSE
    elif [ -f /etc/centos-release ]; then
        OS=CentOS
    elif [ -s /etc/redhat-release ]; then
        OS=RedHat
    elif [ -r /etc/os-release ]; then
        grep 'NAME="Ubuntu"' /etc/os-release > /dev/null 2>&1
        if [ $? == 0 ]; then
            OS=Ubuntu
        fi
    else
        OS="Unknown Linux"
    fi ;;
  *)
    OS="Unknown UNIX/Linux" ;;
esac
echo $OS
