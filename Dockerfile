FROM aialferov/pause

RUN apk --update add iproute2 && \
    rm -rf /var/cache/apk/*
