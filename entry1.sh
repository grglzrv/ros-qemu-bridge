#!/bin/sh

qemu-system-x86_64 \
    -name ros1 \
    -vnc 0.0.0.0:0 \
    -m 256 \
    -hda $ROUTEROS_IMAGE \
    -device e1000,netdev=net0,mac=DE:AD:BE:EF:1E:33 \
    -netdev user,id=net0,net=10.0.2.0/24,dhcpstart=10.0.2.22,hostfwd=tcp::20-:20,hostfwd=tcp::21-:21,hostfwd=tcp::22-:22,hostfwd=tcp::23-:23,hostfwd=tcp::80-:80,hostfwd=tcp::443-:443,hostfwd=tcp::8291-:8291,hostfwd=tcp::8728-:8728,hostfwd=tcp::8729-:8729,hostfwd=udp::5678-:5678,hostfwd=udp::20561-:20561,hostfwd=udp::1194-:1194,hostfwd=tcp::1723-:1723,hostfwd=tcp::1701-:1701,hostfwd=udp::1723-:1723,hostfwd=udp::1701-:1701,hostfwd=tcp::50-:50,hostfwd=tcp::51-:51,hostfwd=udp::500-:500,hostfwd=udp::4500-:4500 \
    -device e1000,netdev=net1,mac=DE:AD:BE:EF:86:F9 -netdev user,id=net1 \
    -device e1000,netdev=net2,mac=DE:AD:BE:EF:0A:D7 -netdev user,id=net2 -device e1000,netdev=net3,mac=DE:AD:BE:EF:6E:85 -netdev user,id=net3
