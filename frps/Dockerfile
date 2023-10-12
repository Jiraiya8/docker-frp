FROM --platform=$TARGETPLATFORM alpine:latest AS builder

LABEL email="yourpipi@proton.me"

ARG FRP_VERSION=0.52.1

ARG TARGETOS

ARG TARGETARCH

ARG TARGETVARIANT

ARG NAME=frp_${FRP_VERSION}_${TARGETOS}_${TARGETARCH}

ARG RELEASE_NAME=${NAME}.tar.gz

RUN set -ex \ 
    && apk update \
    && apk add wget \
    && wget https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/${RELEASE_NAME} -O ${RELEASE_NAME} \
    && tar -zxvf ${RELEASE_NAME} \
    && mv ./${NAME}/frps /usr/local/bin/frps

FROM --platform=$TARGETPLATFORM alpine:latest AS dist

COPY --from=builder /usr/local/bin/frps /usr/local/bin/

RUN set -ex \
    && chmod +x /usr/local/bin/frps \
    && apk update \
    && apk add bash tzdata ca-certificates \
    && rm -rf /var/cache/apk/*

VOLUME [ "/etc/frp/" ]

ENTRYPOINT [ "/usr/local/bin/frps" ]

CMD [ "-c", "/etc/frp/frps.toml" ]
