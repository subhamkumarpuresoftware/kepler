ARG TAG

FROM odidev/kepler_base:latest-${TAG} as builder
#USER root

LABEL name=kepler-builder

RUN yum install -y kernel-devel make git gcc rpm-build systemd && \
    yum clean all -y

RUN if [ $TAG = "arm64" ] ; then \
       curl -LO https://go.dev/dl/go1.18.1.linux-arm64.tar.gz; mkdir -p /usr/local; tar -C /usr/local -xvzf go1.18.1.linux-arm64.tar.gz; rm -f go1.18.1.linux-arm64.tar.gz; \
    else \
       curl -LO https://go.dev/dl/go1.18.1.linux-amd64.tar.gz; mkdir -p /usr/local; tar -C /usr/local -xvzf go1.18.1.linux-amd64.tar.gz; rm -f go1.18.1.linux-amd64.tar.gz; \
    fi 
RUN echo ${ARCH};
# RUN curl -LO https://go.dev/dl/go1.18.1.linux-$TAG.tar.gz; mkdir -p /usr/local; tar -C /usr/local -xvzf go1.18.1.linux-$TAG.tar.gz; rm -f go1.18.1.linux-$TAG.tar.gz
