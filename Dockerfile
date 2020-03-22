FROM runmymind/docker-android-sdk:alpine-standalone

RUN apk update && apk upgrade && \
    apk add gradle npm && \
    npm config set unsafe-perm true && \
    npm install -g cordova

COPY entrypoint.sh /usr/src/entrypoint.sh

ENTRYPOINT ["/bin/sh"]

CMD ["/usr/src/entrypoint.sh"]
