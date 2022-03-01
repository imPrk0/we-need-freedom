#!/bin/bash

# Name: Fuck Tencent Cloud
# Version: 2.0
# Author: Prk
# WebSite: https://www.cprk.cc/
# Date: 2022-03-01
# Location: Huazhou Haizhu Guangzhou Guangdong, People's Republic of China

# Print Menu #
function menu {
    clear
    echo
    echo -e "\t\t\tFuck Tencent Cloud V2.0\n"
    echo -e "\t\t\tby Prk  www.cprk.cc\n"
    echo -e "\t1. Simple Uninstall"
    echo -e "\t2. Delete Tencent Cloud Folder"
    echo -e "\t3. Detect Related Processes"
    echo -e "\t0. Exit\n\n"
    echo -en "\t\tInput Option: "
    read -n 1 option
}

# Simple Uninstall #
function su {
    # Execute the Official Uninstaller #
    /usr/local/qcloud/stargate/admin/uninstall.sh
    /usr/local/qcloud/YunJing/uninst.sh
    /usr/local/qcloud/monitor/barad/admin/uninstall.sh
}

# Delete Tencent Cloud Folder #
function dtcf {
    rm -rf /usr/local/sa
    rm -rf /usr/local/agenttools
    rm -rf /usr/local/qcloud
    process=(sap100 secu-tcs-agent sgagent64 barad_agent agent agentPlugInD pvdriver )
    for i in ${process[@]}
    do
      for A in $(ps aux | grep $i | grep -v grep | awk '{print $2}')
      do
        kill -9 $A
      done
    done
    chkconfig --level 35 postfix off
    service postfix stop
    echo ''>/var/spool/cron/root
}

# Detect Related Processes #
function drp {
    ps -A | grep agent
}

while [ 1 ]
do
    menu
    case $option in
    0)
        break ;;
    1)
        su ;;
    2)
        dtcf ;;
    3)
        drp ;;
    *)
        clear
        echo "INPUT ERROR!";;
    esac
    echo -en "\n\n\t\tUse any key to continue..."
    read -n 1 line
done
clear

# Tips #
# echo -e "${Green}The uninstall script is executed success!${Font} " #
