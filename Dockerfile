FROM quay.io/openvnf/pause:1.1.0

RUN apk --update add iproute2 && \
    rm -rf /var/cache/apk/*
