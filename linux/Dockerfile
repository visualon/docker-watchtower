# renovate: datasource=github-releases depName=watchtower lookupName=containrrr/watchtower
ARG WATCHTOWER_VERSION=1.7.1

FROM alpine:3.20@sha256:77726ef6b57ddf65bb551896826ec38bc3e53f75cdde31354fbffb4f25238ebd as base

#=================
# build
#=================
FROM base as build

RUN apk add --no-cache curl

ARG WATCHTOWER_VERSION
RUN set -ex; \
  curl -sSfLo file.tgz https://github.com/containrrr/watchtower/releases/download/v${WATCHTOWER_VERSION}/watchtower_linux_amd64.tar.gz; \
  tar -C /bin -xzf file.tgz; \
  watchtower --help

#=================
# final
#=================
FROM base as final

RUN apk add --no-cache ca-certificates tzdata dumb-init

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>" \
    org.opencontainers.image.authors="Michael Kriese <michael.kriese@visualon.de>" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.source="https://github.com/visualon/docker-watchtower" \
    org.opencontainers.image.url="https://github.com/visualon/docker-watchtower"

LABEL com.centurylinklabs.watchtower="true"

ENTRYPOINT ["/usr/bin/dumb-init", "--", "/bin/watchtower"]

ARG WATCHTOWER_VERSION
LABEL org.opencontainers.image.version="${WATCHTOWER_VERSION}"

COPY --from=build /bin/watchtower /bin/

