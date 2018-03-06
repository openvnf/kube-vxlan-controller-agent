FROM alpine

RUN apk --update add iproute2 && \
    rm -rf /var/cache/apk/*

ADD bin /bin

ENTRYPOINT ["/bin/kube-vxlan-controller-agent"]
