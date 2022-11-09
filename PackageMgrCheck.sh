#!/bin/bash
#Simple Package Managaer Checker


#Debian/Ubuntu based package annalisis
if (which apt &>/dev/null)
then
   item_apt=1
   echo "You have apt basic utility"
else
   item_apt=0
fi

if (which dpkg &>/dev/null)
then
   item_dpkg=1
fi

if (which snap &>/dev/null)
then
   item_snap=1
   #echoYou have Flatpak
fi



#####
#RedHat based package analisis
if (which dnf &>/dev/null)
then
   item_dnf=1
else
   item_dnf=0
fi

if (which yum &>/dev/null)
then
   item_yum=1
fi

if (which flatpak &>/dev/null)
then
   item_flatpak=1
   #echoYou have Flatpak
fi

#set scores sum
debian_score=[$item_apt + $item_dpkg + $item_snap]
redhat_score=[$item_dnf + $item_yum + $item_flatpak]



#Determine which distro is used



