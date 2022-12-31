FROM runmymind/docker-android-sdk:alpine-standalone

RUN apk update && apk upgrade && \
    apk del openjdk11 && \
    apk add gradle npm openjdk8 && \
    echo > unsafe-perm=true ~/.npmrc && \
    npm install -g cordova

ENV JAVA_HOME "/usr/lib/jvm/java-8-openjdk"

COPY entrypoint.sh /usr/src/entrypoint.sh

ENTRYPOINT ["/usr/src/entrypoint.sh"]
