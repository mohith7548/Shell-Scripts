#!/bin/sh

# Color specific variables
RED='\033[0;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
WHITE='\033[1;37m'

# Dependencies => figlet, htop, neofetch, speedtest-cli, net-tools
bash resdep.sh figlet
bash resdep.sh htop
bash resdep.sh neofetch
bash resdep.sh speedtest-cli
bash resdep.sh net-tools

# Clear screen
clear

# Banner
figlet 'Welcome to my Script' -c

# Wish the user
printf "${WHITE}Hello ${YELLOW}"$LOGNAME
printf "!\n"

# Show Last read file
printf "${WHITE}Last read: `stat -c '%x' ~/osproj.sh`\n"
echo 

# Main while loop starts
while :
printf "${GREEN}--------------------------------------------\n"
echo "Select what you want to Do:"
echo 
echo "0 - Tell me about this machine"
echo "1 - Show the RAM status"
echo "2 - Show realtime cpu and processes"
echo "3 - Total number of processes running currently"
echo "4 - Show the Size status of root Directory"
echo "5 - Print architecture of this machine"
echo "6 - Kernel version"
echo "7 - Show my mac-address"
echo "8 - Do speed-test"
echo "v - Update deb packages"
echo "w - Upgrade deb packages"
echo "x - Upgrade my distribution"
echo "y - Remove un-neccessary packages"
echo "z - Install a package"
echo "e - To exit"
printf "${GREEN}--------------------------------------------\n"
printf ">${YELLOW} " 
do
  read INPUT_STRING
  case $INPUT_STRING in

	0)
		echo 
#		uname -a
		neofetch
		echo 
		;;

	1)
		echo 
		free -h | grep Mem | awk '{printf "RAM status: %sB/%sB\n", $3, $2}'
		echo 
		;;

	2)
		htop
		echo 
		;;

	3)
		printf "Total number of processes running currently: "
		ps -aux | wc -l
		echo 
		;;

	4)
		df -h | awk ' $6 == "/" { printf "Disk Used: %sB/%sB\n", $3, $2 }'
		echo 
		;;

	5)
		echo 
		dpkg --print-architecture
		echo 
		;;

	6)
		echo 
		uname -mrs
		echo 
		;;

	7)
		echo 
		printf "Your mac-address is: "
		ifconfig | grep ether | awk 'NR==2{print $2}'
		echo 
		;;

	8)
		echo 
		speedtest-cli
		echo 
		;;

	v)
		sudo apt-get update
		echo 
		;;

	w)
		sudo apt-get upgrade -y
		echo 
		;;

	x)
		sudo apt dist-upgrade -y
		echo 
		;;

	y)
		sudo apt autoremove -y
		echo 
		;;

	z)
		printf "Enter package names with space if more than one: "
		read pk_names
		echo 
		sudo apt-get install $pk_names
		echo 
		;;

	e)
		echo "See you again!"
		echo 
		break
		;;

	*)
		echo "Sorry, I don't understand"
		echo 
		;;

  esac
done
echo 
echo "That's all folks!"


