# Introduction

[![Docker Repository on Quay](https://quay.io/repository/coryodaniel/kinesis-agent/status "Docker Repository on Quay")](https://quay.io/repository/coryodaniel/kinesis-agent)

Docker Alpine image with OpenJDK and AWS Kinesis Agent.

## Usage

```docker
FROM quay.io/coryodaniel/kinesis-agent
COPY agent.json /etc/aws-kinesis/agent.json
```

### Environment variables

* `AGENT_VERSION`: Github tagged version. (default: 1.1.3)
* `LOG_LEVEL`: Log level. Can be `TRACE`, `DEBUG`, `INFO`, `WARN`, or `ERROR`. (Default: `INFO`)
* `JAVA_START_HEAP`: Java initial heap size (default: `256m`)
* `JAVA_MAX_HEAP`: Java maximum heap size (default: `512m`)

The kinesis agent will default to IAM Role authentication, or you can explicitly set:

* `AWS_ACCESS_KEY_ID`
* `AWS_SECRET_ACCESS_KEY`

### Kinesis agent log files

The agent's log files are located in `/var/log/aws-kinesis-agent/`.
