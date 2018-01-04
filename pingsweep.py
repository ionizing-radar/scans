import sys, os
import ipaddress

print sys.argv[1]

discovered_hosts = []
ping_target = ipaddress.ip_network(str(sys.argv[1]).decode('utf-8'))

for ip_target in ping_target.hosts():
  ping_result = os.system('ping -c 1 '+str(ip_target)+' > /dev/null')
  if ping_result == 0:
    discovered_hosts.append(ip_target)

print 'Discovered '+str(len(discovered_hosts))+' hosts'
for host in discovered_hosts:
  print str(host)


