#!/bin/bash

funcKey() {
SHORT=a:,t:,tL:
LONG=all:,target:,local:
OPTS=$(getopt --options $SHORT --longoptions $LONG -- "$@")
echo $1 $2
}

funcA() { 
case "$1" in
	-a | --all)
	  sudo nmap -sP $2
	  ;;

	*)
	echo -e "Unknown command     "==$1=="\nAvailable flags are:\n--all(-a) [IP address here] - displays the IP addresses and symbolic names of all hosts in the current subnet\n--target(-t) - displays a list of open target IP TCP ports\n--local(tL) - display a list of opet system TCP ports "
	;;
esac
}

funcB() {
case "$1" in
        -t | --target)
	  echo -e "target IP open TCP ports are : "
          sudo nmap -sT -O $2
	  ;;
	-tL | --local) 
	  echo -e "localhost IP opent TCP ports are : "
	  sudo nmap -sT -O localhost
          ;;

        *)
        echo -e "Unknown command     "==$1=="\nAvailable flags are:\n--all(-a) [IP address here] - displays the IP addresses and symbolic names of all hosts in the current subnet\n--target(-t) - displays a list of open target IP TCP ports\n--local(tL) - display a list of opet system TCP ports "
        ;;
esac
}

funcAB () {
funcKey $1 $2

if [ $1 == "-a" ] || [ $1 == "--all" ]
then
      funcA $1 $2

elif [ $1 == "-t" ] || [ "-tL" ] || [ "--target" ] || [ "--local" ] 
then
	funcB $1 $2
else
	echo -e "Unknown command\nAvailable flags are:\n--all(-a) [IP address here] - displays the IP addresses and symbolic names of all hosts in the current subnet\n--target(-t) - displays a list of open target IP TCP ports\n--local(tL) - display a list of opet system TCP ports "
fi
}

funcAB $1 $2
