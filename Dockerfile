FROM adoptopenjdk/openjdk11:x86_64-ubuntu-jdk-11.0.16.1_1-slim

WORKDIR /app
EXPOSE 8000
VOLUME /app/data

RUN \
    apt-get update && \
    apt-get install -y wget && \
    apt-get install -y unzip && \
    VERSION=6.5.1 &&\
    wget https://services.gradle.org/distributions/gradle-${VERSION}-bin.zip -P /tmp &&\
    unzip -d /opt/gradle /tmp/gradle-${VERSION}-bin.zip &&\
    ln -s /opt/gradle/gradle-${VERSION} /opt/gradle/latest

ENV PATH="/opt/gradle/latest/bin:$PATH"

CMD [ "gradle", "--version" ]