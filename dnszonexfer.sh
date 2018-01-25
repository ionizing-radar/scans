#!/bin/bash

#check domain parameter
if [ -z "$1" ]; then
echo "target domain required"
exit 0
fi

#because arugment variables get confuzing
DOMAIN=$1
SAVE="$DOMAIN.hosts"

#iterate nameservers (with -t ns) of the domain
for SERVER in $(host -t ns $DOMAIN | cut -d " " -f 4);do
#   echo $DOMAIN $SERVER
   host -l $DOMAIN $SERVER | grep "has address" > $SAVE
done

