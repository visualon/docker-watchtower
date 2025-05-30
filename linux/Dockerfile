# renovate: datasource=github-releases depName=watchtower packageName=containrrr/watchtower
ARG WATCHTOWER_VERSION=1.7.1

FROM alpine:3.22@sha256:8a1f59ffb675680d47db6337b49d22281a139e9d709335b492be023728e11715 as base

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

