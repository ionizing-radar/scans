#!/bin/bash
# will do an aggresive nmap scan and save

#check target list parameter
if [ -z "$1" ]; then
echo "input file required"
exit 0
fi

INPUT_FILE=$1

while IFS= read -r host; do
   nmap -v -A -oA $host $host
done <"$INPUT_FILE"


##iterate nameservers (with -t ns) of the domain
#for HOST in $(host -t ns $HOSTS_FILE | cut -d " " -f 4);do
##   echo $DOMAIN $SERVER
#   host -l $DOMAIN $SERVER | grep "has address" > $SAVE
#done
