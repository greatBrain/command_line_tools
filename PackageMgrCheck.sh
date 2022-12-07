#!/bin/bash
#Simple Package Managaer Checker
#Debian/Ubuntu based package annalisis
if (which apt &>/dev/null);then
   item_apt=1
fi

if (which dpkg &>/dev/null);then
   item_dpkg=1
fi

#RedHat based package analisis
if (which dnf &>/dev/null);then item_dnf=1
else
   item_dnf=0
fi

if (which yum &>/dev/null);then item_yum=1
fi

#set scores sum
debian_score=[$item_apt + $item_dpkg]
redhat_score=[$item_dnf + $item_yum]

if [$debian_score -gt $redhat_score];then echo "You have a Debian based distro."
else
   echo "You have a Redhat based distro."
fi
