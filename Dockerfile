FROM runmymind/docker-android-sdk:alpine-standalone

RUN export JAVA_HOME=/usr/lib/jvm/java-8-openjdk

RUN apk update && apk upgrade && \
    apk del openjdk11 && \
    apk add gradle npm openjdk8 && \
    npm config set unsafe-perm true && \
    npm install -g cordova

COPY entrypoint.sh /usr/src/entrypoint.sh

ENTRYPOINT ["/usr/src/entrypoint.sh"]
