FROM openjdk:11.0.6-slim

ARG GIT_BRANCH
ARG GIT_COMMIT
ARG VERSION
ARG BUILD_TIMESTAMP

USER root

RUN mkdir -p /deployment

ADD app.jar /deployment/
ADD docker-entrypoint.sh /

RUN chmod -R 770 /deployment \
    && chmod 770 /docker-entrypoint.sh

WORKDIR /deployment

USER 1001

EXPOSE 8080

ENTRYPOINT ["/docker-entrypoint.sh"]

LABEL VERSION="${VERSION}" \
      GIT_BRANCH="${GIT_BRANCH}" \
      GIT_COMMIT="${GIT_COMMIT}" \
      BUILD_TIMESTAMP="${BUILD_TIMESTAMP}"
