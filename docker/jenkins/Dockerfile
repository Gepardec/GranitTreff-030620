ARG VERSION=latest
FROM jenkins/jenkins:${VERSION}

ARG RUN_AS=jenkins
ARG KUBECTL_VERSION=1.16.5-00
ARG DOCKER_CE_CLI_VERSION=5:19.03.8~3-0~debian-buster

# Tell the CAS plugin wehre to search for configurations
ENV CASC_JENKINS_CONFIG=/usr/share/jenkins/ref/config

USER root

ADD plugins.txt /usr/share/jenkins/ref/

RUN curl -sL https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
    && curl -sL https://download.docker.com/linux/debian/gpg | apt-key add - \
    && echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list \
    && echo "deb [arch=amd64] https://download.docker.com/linux/debian buster stable" | tee -a /etc/apt/sources.list.d/docker.list \
    && apt-get update \
    && apt-get remove -y docker docker-engine docker.io containerd runc \
    && apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        gnupg2 \
        software-properties-common \
        docker-ce-cli=${DOCKER_CE_CLI_VERSION} \
        kubectl=${KUBECTL_VERSION} \
    && apt-get clean \
    && mkdir -p /usr/share/jenkins/ref/config \
    && chown -R jenkins:jenkins /usr/share/jenkins/ref

USER ${RUN_AS}

RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt 
