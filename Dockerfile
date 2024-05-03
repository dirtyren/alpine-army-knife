FROM grafana/k6:latest as builder
WORKDIR /home/k6

FROM alpine:3.19

RUN apk add ffmpeg
RUN apk add tcpdump
RUN apk add net-tools
RUN apk add bash
RUN apk add nginx
RUN apk add php
RUN apk add curl
RUN apk add vim
RUN apk add nano
RUN apk add wget
RUN apk add nfs-utils
RUN apk add unionfs-fuse
RUN apk add mysql-client
RUN apk add openssl
RUN apk add apache2
RUN apk add apache2-utils
RUN apk add net-snmp
RUN apk add net-snmp-tools
RUN apk add iptraf-ng
RUN apk add bwm-ng
RUN apk add ngrep
RUN apk add tree
RUN apk add traceroute
RUN apk add tcptraceroute
RUN apk add tmux
RUN apk add socat
RUN apk add psmisc
RUN apk add openssh-client
RUN apk add nmap
RUN apk add netcat-openbsd
RUN apk add mandoc man-pages mandoc-apropos less less-doc
RUN apk add iptables
RUN apk add collectd-iptables
RUN apk add mtr
RUN apk add jq
RUN apk add ipset
RUN apk add iproute2
RUN apk add iperf
RUN apk add iperf3
RUN apk add ethtool
RUN apk add bind-tools
RUN apk add openldap-clients
RUN apk add openldap
RUN apk add less
RUN apk add arping
RUN apk add arp-scan
RUN apk add arpwatch
RUN apk add conntrack-tools
RUN apk add ca-certificates ca-certificates-bundle
RUN apk add bridge-utils
RUN apk add git
RUN apk add stress-ng
RUN apk add file
RUN apk add minio-client

WORKDIR /

#RUN curl -sLf https://storage.googleapis.com/kubernetes-release/release/v1.16.8/bin/linux/amd64/kubectl > /usr/local/bin/kubectl-1.16
RUN curl -sLf https://storage.googleapis.com/kubernetes-release/release/v1.17.4/bin/linux/amd64/kubectl > /usr/local/bin/kubectl-1.17
RUN curl -sLf https://storage.googleapis.com/kubernetes-release/release/v1.18.0/bin/linux/amd64/kubectl > /usr/local/bin/kubectl-1.18
RUN chmod +x /usr/local/bin/kubectl*
RUN ln -s /usr/local/bin/kubectl-1.18 /usr/local/bin/kubectl

RUN curl -sLf https://github.com/Netflix/bpftop/releases/download/v0.4.2/bpftop > /usr/local/bin/bpftop

COPY index.html  /var/lib/nginx/html/index.html
COPY default.conf /etc/nginx/http.d

COPY --from=builder /usr/bin/k6 /usr/bin/k6

RUN rm -rf /var/cache/apk/*

EXPOSE 80

WORKDIR /root
CMD ["nginx", "-g", "daemon off;"]
#CMD ["swiss-army-knife"]
