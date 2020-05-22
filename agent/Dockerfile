ARG VERSION=4.3-4-jdk11
FROM jenkins/inbound-agent:${VERSION}

ARG KUBECTL_VERSION=1.16.5-00
ARG DOCKER_CE_CLI_VERSION=5:19.03.8~3-0~debian-buster
USER root 

RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
    && echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list \
    && echo "deb [arch=amd64] https://download.docker.com/linux/debian buster stable" | tee -a /etc/apt/sources.list.d/docker.list \
    && apt-get update \
    && apt-get remove docker docker-engine docker.io containerd runc \
    && apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        gnupg2 \
        software-properties-common \
        docker-ce-cli=${DOCKER_CE_CLI_VERSION} \
        kubectl=${KUBECTL_VERSION} \
    && apt-get clean

USER jenkins