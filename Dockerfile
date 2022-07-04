# -----------------------------------------------------------------------------
# K6
# Latest versions: https://github.com/grafana/k6

ARG K6_VERSION=0.38.3
FROM grafana/k6:$K6_VERSION as k6

FROM europe-docker.pkg.dev/flownative/docker/base:bullseye
MAINTAINER Robert Lemke <robert@flownative.com>

ENV K6_VERSION=$K6_VERSION

ENV FLOWNATIVE_LIB_PATH=/opt/flownative/lib \
    K6_BASE_PATH=/opt/flownative/k6 \
    LOG_DEBUG=false

USER root

COPY root-files /
COPY --from=k6 /usr/bin/k6 ${K6_BASE_PATH}/bin/k6

RUN /build.sh

USER k6
ENTRYPOINT ["/entrypoint.sh"]
CMD [ "run" ]
