#!/usr/bin/env bash
set -eo pipefail

# Setup environment
source /opt/docker/libexec/common.sh
source /opt/docker/libexec/hadoop-vars.sh

render_templates /opt/docker/conf/hadoop $HADOOP_CONF_DIR

source $HADOOP_HOME/etc/hadoop/hadoop-env.sh
