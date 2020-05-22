#!/bin/bash

exec java ${JAVA_OPTS} -Djava.net.preferIPv4Stack=true -jar /deployment/app.jar ${@}