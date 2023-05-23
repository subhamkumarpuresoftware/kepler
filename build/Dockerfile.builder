ARG TAG

FROM odidev/kepler_base:latest-${TAG} as builder
ENV ARCH=${TAG}
#USER root

LABEL name=kepler-builder

RUN yum install -y kernel-devel make git gcc rpm-build systemd && \
    yum clean all -y

RUN curl -LO https://go.dev/dl/go1.18.1.linux-${ARCH}.tar.gz; mkdir -p /usr/local; tar -C /usr/local -xvzf go1.18.1.linux-${ARCH}.tar.gz; rm -f go1.18.1.linux-${ARCH}.tar.gz
