ARG TAG=amd64

FROM odidev/kepler_base:latest-${TAG} as builder
#USER root
ARG ARCH
# RUN echo $ARCH;
# LABEL name=kepler-builder

RUN yum install -y kernel-devel make git gcc rpm-build systemd && \
    yum clean all -y

# RUN if [ ${ARCH} == "arm64" ] ; then \
#        curl -LO https://go.dev/dl/go1.18.1.linux-arm64.tar.gz; mkdir -p /usr/local; tar -C /usr/local -xvzf go1.18.1.linux-arm64.tar.gz; rm -f go1.18.1.linux-arm64.tar.gz; \
#     else \
#        curl -LO https://go.dev/dl/go1.18.1.linux-amd64.tar.gz; mkdir -p /usr/local; tar -C /usr/local -xvzf go1.18.1.linux-amd64.tar.gz; rm -f go1.18.1.linux-amd64.tar.gz; \
#     fi 
# RUN echo ${ARCH};
RUN curl -LO https://go.dev/dl/go1.18.1.linux-${ARCH}.tar.gz; mkdir -p /usr/local; tar -C /usr/local -xvzf go1.18.1.linux-${ARCH}.tar.gz; rm -f go1.18.1.linux-${ARCH}.tar.gz
