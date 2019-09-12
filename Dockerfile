FROM openjdk:8u171-jdk-alpine3.7
MAINTAINER Cory ODaniel "docker@coryodaniel.com"

ENV AGENT_VERSION=1.1.3 \
    JAVA_START_HEAP=256m \
    JAVA_MAX_HEAP=512m \
    LOG_LEVEL=INFO

WORKDIR /app

RUN apk add --no-cache shadow curl bash apache-ant \
    && curl -LO https://github.com/awslabs/amazon-kinesis-agent/archive/${AGENT_VERSION}.tar.gz \
    && tar xvzf ${AGENT_VERSION}.tar.gz \
    && rm ${AGENT_VERSION}.tar.gz \
    && mv amazon-kinesis-agent-${AGENT_VERSION} amazon-kinesis-agent \
    && cd amazon-kinesis-agent \
    && ./setup --build

COPY agent.json /etc/aws-kinesis/agent.json
COPY start.sh .

ENV AWS_CBOR_DISABLE=1
ENV AWS_ACCESS_KEY_ID=aaaaaaaaaaaaaaaaaaaa
ENV AWS_SECRET_ACCESS_KEY=bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb

CMD ["./start.sh"]
