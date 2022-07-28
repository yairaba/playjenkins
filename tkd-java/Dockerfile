FROM yairaba/tkd-base AS ztkd-java

ENV JAVA_HOME=/usr/lib/jvm/java-8-oracle/
ARG DEBIAN_FRONTEND=noninteractive

RUN \
    JAVA_BUILD=8u301 && \
    dpkgArch="$(dpkg --print-architecture)"; \
    JAVA_FILE="jdk-$JAVA_BUILD-linux-$dpkgArch.tar.gz" ; \
    apt-get update  && \
    curl -Ls \
        --cookie "oraclelicense=accept-securebackup-cookie;" \
       https://tk-public.s3.eu-west-1.amazonaws.com/docker/$JAVA_FILE \
        | tar xz -C /tmp && \
    mkdir -p /usr/lib/jvm && mv /tmp/jdk1.8.0_301 "${JAVA_HOME}" && \
    apt-get autoclean && apt-get --purge -y autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    update-alternatives --install "/usr/bin/java" "java" "${JAVA_HOME}/bin/java" 1 && \
    update-alternatives --install "/usr/bin/javac" "javac" "${JAVA_HOME}/bin/javac" 1 && \
    update-alternatives --set java "${JAVA_HOME}/bin/java" && \
    update-alternatives --set javac "${JAVA_HOME}/bin/javac"
