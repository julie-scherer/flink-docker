FROM openjdk:11-jre-slim

ARG FLINK_VERSION=${FLINK_VERSION}
ARG SCALA_VERSION=${SCALA_VERSION}

RUN apt-get update && \
    apt-get install -y wget && \
    wget https://archive.apache.org/dist/flink/flink-${FLINK_VERSION}/flink-${FLINK_VERSION}-bin-scala_${SCALA_VERSION}.tgz && \
    tar -xzf flink-${FLINK_VERSION}-bin-scala_${SCALA_VERSION}.tgz && \
    rm flink-${FLINK_VERSION}-bin-scala_${SCALA_VERSION}.tgz && \
    ln -s /flink-${FLINK_VERSION} /flink

ENV PATH="/flink/bin:${PATH}"

EXPOSE 8081

CMD ["jobmanager.sh", "start-foreground"]
