FROM eclipse-temurin:17-jdk-jammy

ENV ANDROID_HOME=/opt/android-sdk
ENV ANDROID_SDK_ROOT=${ANDROID_HOME}
ENV GRADLE_HOME=/opt/gradle
ENV PATH=${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/platform-tools:${GRADLE_HOME}/bin:${PATH}

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl unzip ca-certificates gnupg && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y --no-install-recommends nodejs && \
    rm -rf /var/lib/apt/lists/*

# Ubuntu's apt gradle package (4.4.1) predates JDK 17 support entirely
# and can't even bootstrap a newer wrapper under it - install a
# current Gradle release directly instead. Only used to bootstrap
# cordova's own gradlew, which then pulls whichever exact version the
# generated Android project actually declares.
RUN curl -fsSL -o /tmp/gradle.zip https://services.gradle.org/distributions/gradle-8.14.2-bin.zip && \
    unzip -q /tmp/gradle.zip -d /opt && \
    mv /opt/gradle-8.14.2 ${GRADLE_HOME} && \
    rm /tmp/gradle.zip

RUN mkdir -p ${ANDROID_HOME}/cmdline-tools && \
    curl -fsSL -o /tmp/cmdline-tools.zip https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip && \
    unzip -q /tmp/cmdline-tools.zip -d ${ANDROID_HOME}/cmdline-tools && \
    mv ${ANDROID_HOME}/cmdline-tools/cmdline-tools ${ANDROID_HOME}/cmdline-tools/latest && \
    rm /tmp/cmdline-tools.zip

# AGP's auto-download doesn't kick in here, so install explicitly.
# cordova-android tracks the latest Android API level on npm (36 as
# of this writing) independent of anything pinned in this Dockerfile -
# if a future cordova-android bump changes what it asks for, these
# versions need to move with it.
RUN yes | sdkmanager --licenses > /dev/null && \
    sdkmanager --install "platform-tools" "platforms;android-36" "build-tools;36.0.0" > /dev/null

RUN npm install -g cordova

COPY entrypoint.sh /usr/src/entrypoint.sh

ENTRYPOINT ["/usr/src/entrypoint.sh"]
