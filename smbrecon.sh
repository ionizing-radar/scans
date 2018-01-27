#!/bin/bash
# will print out all the Windows SMB servers on a network

#check domain parameter
if [ -z "$1" ]; then
echo "network address required"
exit 0
fi

NETWORK=$1

nmap -p 139,445 --script=smb-ls $NETWORK -oG /tmp/smbrecon.results
cat /tmp/smbrecon.results | grep open | cut -d " " -f 2 > /tmp/smb.hosts

nmap -n -v -p139,445 --script=smb-os-discovery -i smb.hosts -oG /tmp/smb.nmap
cat /tmp/smb.nmap | grep Windows | cut -d " " -f 2 > /tmp/smb.windows

for SCRIPT in $(cat smb-vuln-list); do
   nmap -nv --script=$SCRIPT -p445 -i /tmp/smb.windows -oA results/$SCRIPT
done

