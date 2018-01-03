#!/bin/bash

echo -n "Staring pingsweep"

echo "" > pingsweep.tmp

counter=1
while [ $counter -le 255 ]
  do
    ping_target="ping 10.11.1.$counter -c 1"
    echo -n "."
    $($ping_target >> pingsweep.tmp) 
    ((counter++))
  done

echo "Found Hosts:"
grep "ttl" pingsweep.tmp | cut -d " " -f 4 | sort -u > pingsweep.hosts
cat pingsweep.hosts
