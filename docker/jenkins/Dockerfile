ARG VERSION=latest
FROM jenkins/jenkins:${VERSION}

ARG RUN_AS=jenkins

# Tell the CAS plugin wehre to search for configurations
ENV CASC_JENKINS_CONFIG=/usr/share/jenkins/ref/config

USER root

ADD plugins.txt /usr/share/jenkins/ref/

RUN mkdir -p /usr/share/jenkins/ref/config \
    && chown -R jenkins:jenkins /usr/share/jenkins/ref

USER ${RUN_AS}

RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt 
