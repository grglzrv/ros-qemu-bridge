FROM alpine:3.8

ENV ROUTEROS_VERSON="6.46.1"
ENV ROUTEROS_IMAGE="chr-$ROUTEROS_VERSON.vdi"
ENV ROUTEROS_PATH="https://download.mikrotik.com/routeros/$ROUTEROS_VERSON/$ROUTEROS_IMAGE"
ENV ROUTEROS_IMAGE2="chr-$ROUTEROS_VERSON-2.vdi"

RUN mkdir /routeros
WORKDIR /routeros
ADD [".", "/routeros"]

RUN apk add --no-cache --update bash nano curl supervisor netcat-openbsd qemu-x86_64 qemu-system-x86_64 \
 && echo ">>> $ROUTEROS_PATH" \
 && if [ ! -e "$ROUTEROS_IMAGE" ]; then wget "$ROUTEROS_PATH"; fi

RUN cp -p "$ROUTEROS_IMAGE" "$ROUTEROS_IMAGE2"

RUN mkdir -p /var/log/supervisor && \
    mkdir -p /etc/supervisor/conf.d

# supervisor base configuration
ADD supervisor.conf /etc/supervisor.conf

# For access via VNC
EXPOSE 5900
EXPOSE 25900

# Default ports of RouterOS
EXPOSE 20
EXPOSE 220
EXPOSE 21
EXPOSE 221
EXPOSE 22
EXPOSE 222
EXPOSE 23
EXPOSE 223
EXPOSE 80
EXPOSE 280
EXPOSE 443
EXPOSE 2443
EXPOSE 8291
EXPOSE 28291
EXPOSE 8728
EXPOSE 28728
EXPOSE 8729
EXPOSE 28729
EXPOSE 5678
EXPOSE 25678

EXPOSE 20561
EXPOSE 22561
# IPSec
EXPOSE 50
EXPOSE 250
EXPOSE 51
EXPOSE 251
EXPOSE 500/udp
EXPOSE 2500/udp
EXPOSE 22500/udp
EXPOSE 4500/udp
EXPOSE 24500/udp

# OpenVPN
EXPOSE 1194
EXPOSE 21194

# L2TP
EXPOSE 1701
EXPOSE 21701

# PPTP
EXPOSE 1723
EXPOSE 21723
CMD ["sysctl", "-w", "net.ipv4.ping_group_range='0 2147483647'"]
CMD ["sysctl", "-w", "net.ipv4.ip_forward=1"]

ENTRYPOINT ["bash", "/routeros/supervisor.sh"]
