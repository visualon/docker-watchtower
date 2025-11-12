# renovate: datasource=github-releases depName=watchtower packageName=nicholas-fedor/watchtower
ARG WATCHTOWER_VERSION=1.12.2

FROM alpine:3.22@sha256:4b7ce07002c69e8f3d704a9c5d6fd3053be500b7f1c69fc0d80990c2ad8dd412 as base

#=================
# build
#=================
FROM base AS build

RUN apk add --no-cache curl

ARG WATCHTOWER_VERSION
RUN set -ex; \
  curl -sSfLo file.tgz https://github.com/nicholas-fedor/watchtower/releases/download/v${WATCHTOWER_VERSION}/watchtower_linux_amd64_${WATCHTOWER_VERSION}.tar.gz; \
  tar -C /bin -xzf file.tgz; \
  watchtower --help

#=================
# final
#=================
FROM base AS final

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

