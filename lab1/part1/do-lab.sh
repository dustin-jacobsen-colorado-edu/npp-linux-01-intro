#!/usr/bin/bash

# INCLUDE ALL COMMANDS NEEDED TO PERFORM THE LAB
# This file will get called from capture_submission.sh
./provided/change_mac_addrs.sh


docker exec -it clab-lab1-part1-switch ip addr add 192.168.1.1/24 dev eth1

docker exec -it clab-lab1-part1-host1 ip addr add 192.168.1.2/24 dev eth1
docker exec -it clab-lab1-part1-host2 ip addr add 192.168.1.3/24 dev eth1
docker exec -it clab-lab1-part1-host3 ip addr add 192.168.1.4/24 dev eth1
docker exec -it clab-lab1-part1-host4 ip addr add 192.168.1.5/24 dev eth1


docker exec -it clab-lab1-part1-switch ip link add mybridge type bridge
docker exec -it clab-lab1-part1-switch ip link set mybridge up
docker exec -it clab-lab1-part1-switch ip link set eth1 master mybridge 
docker exec -it clab-lab1-part1-switch ip link set eth2 master mybridge 
docker exec -it clab-lab1-part1-switch ip link set eth3 master mybridge 
docker exec -it clab-lab1-part1-switch ip link set eth4 master mybridge 
