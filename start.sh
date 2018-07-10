#!/bin/bash

# Log files are in /var/log/aws-kinesis-agent/

OOME_ARGS_DEFAULT="\"/bin/kill -9 %p\""
OOME_ARGS="-XX:OnOutOfMemoryError=${OOME_ARGS:-$OOME_ARGS_DEFAULT}"

LIB_DIR="/app/amazon-kinesis-agent/"
CLASSPATH="$LIB_DIR":$(find "$LIB_DIR" -type f -name \*.jar | paste -s -d:):"$CLASSPATH"

JVM_ARGS="-server -Xms${JAVA_START_HEAP} -Xmx${JAVA_MAX_HEAP} $JVM_ARGS"
MAIN_CLASS="com.amazon.kinesis.streaming.agent.Agent"

exec java $JVM_ARGS "$OOME_ARGS" -cp "$CLASSPATH" $MAIN_CLASS "$@"
