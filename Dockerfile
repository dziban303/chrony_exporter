ARG ARCH="amd64"
ARG OS="linux"
FROM quay.io/prometheus/busybox-${OS}-${ARCH}:latest
LABEL org.opencontainers.image.maintainer="Dziban Molniya <dziban303@gmail.com>"
LABEL org.opencontainers.image.url="https://github.com/dziban303/chronyx"
LABEL org.opencontainers.image.source="https://github.com/SuperQ/chrony_exporter"
LABEL org.opencontainers.image.title="chronyx"
LABEL org.opencontainers.image.description="A Prometheus exporter for the chrony NTP daemon."
LABEL org.opencontainers.image.licenses="Apache-2.0"

ARG ARCH="amd64"
ARG OS="linux"
COPY .build/${OS}-${ARCH}/chronyx /bin/chronyx
COPY LICENSE                                /LICENSE

USER       nobody
ENTRYPOINT ["/bin/chronyx"]
EXPOSE     9123
