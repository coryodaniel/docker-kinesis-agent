FROM quay.io/coryodaniel/debian-jdk:latest
MAINTAINER Cory ODaniel "docker@coryodaniel.com"

ENV AGENT_VERSION 1.1.3
ENV JAVA_HOME "/usr/lib/jvm/java-9-openjdk-amd64/"

WORKDIR /app
RUN apt-get update \
  && apt-get install -y --no-install-recommends apt-utils curl \
  && apt-get clean \
  && curl -LOk https://github.com/awslabs/amazon-kinesis-agent/archive/1.1.3.tar.gz \
  && tar xvzf 1.1.3.tar.gz \
  && rm 1.1.3.tar.gz \
  && cd amazon-kinesis-agent-1.1.3 \
  && ./setup --install \
  && cd -

COPY agent.json /etc/aws-kinesis/agent.json

# CMD /usr/bin/start-aws-kinesis-agent -L $LOG_LEVEL -l /dev/stdout
