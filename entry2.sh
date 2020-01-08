#!/bin/sh
qemu-system-x86_64 \
    -name ros2 \
    -m 256 \
    -hda $ROUTEROS_IMAGE2 \
    -device e1000,netdev=net0,mac=DE:AD:BE:EF:DA:9F \
    -netdev user,id=net0,net=10.0.2.0/24,dhcpstart=10.0.2.22,hostfwd=tcp::220-:20,hostfwd=tcp::221-:21,hostfwd=tcp::222-:22,hostfwd=tcp::223-:23,hostfwd=tcp::280-:80,hostfwd=tcp::2443-:443,hostfwd=tcp::28291-:8291,hostfwd=tcp::28728-:8728,hostfwd=tcp::28729-:8729,hostfwd=udp::25678-:5678,hostfwd=udp::22561-:20561,hostfwd=udp::21194-:1194,hostfwd=tcp::21723-:1723,hostfwd=tcp::21701-:1701,hostfwd=udp::21723-:1723,hostfwd=udp::21701-:1701,hostfwd=tcp::250-:50,hostfwd=tcp::251-:51,hostfwd=udp::2500-:500,hostfwd=udp::24500-:4500 \
    -device e1000,netdev=net1,mac=DE:AD:BE:EF:82:8D -netdev user,id=net1 \
    -device e1000,netdev=net2,mac=DE:AD:BE:EF:16:71 -netdev user,id=net2 -device e1000,netdev=net3,mac=DE:AD:BE:EF:93:F2 -netdev user,id=net3
