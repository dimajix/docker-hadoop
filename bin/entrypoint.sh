#!/bin/bash
set -eo pipefail

# Setup environment
source /opt/docker/libexec/hadoop-init.sh


check_namenode_dirs() {
    for d in $(echo $1 | tr "," "\n"); do
        if [ ! -d $d/current ]; then
            return 1
        fi
    done

    return 0
}


start_namenode() {
    if ! check_namenode_dirs $HDFS_NAMENODE_DIRS; then
        $HADOOP_HOME/bin/hdfs namenode -format dmx-hdfs
        sleep 5
    fi
	$HADOOP_HOME/sbin/hadoop-daemon.sh --config $HADOOP_CONF_DIR --script hdfs start namenode
    check_java
}

start_resourcemanager() {
	$HADOOP_HOME/sbin/yarn-daemon.sh --config $HADOOP_CONF_DIR start resourcemanager
    check_java
}

start_historyserver() {
	$HADOOP_HOME/sbin/mr-jobhistory-daemon.sh --config $HADOOP_CONF_DIR start historyserver
    check_java
}

start_slavenode() {
	$HADOOP_HOME/sbin/hadoop-daemon.sh --config $HADOOP_CONF_DIR --script hdfs start datanode
	$HADOOP_HOME/sbin/yarn-daemon.sh --config $HADOOP_CONF_DIR start nodemanager
    check_java
}

start_datanode() {
	$HADOOP_HOME/sbin/hadoop-daemon.sh --config $HADOOP_CONF_DIR --script hdfs start datanode
    check_java
}

start_nodemanager() {
	$HADOOP_HOME/sbin/yarn-daemon.sh --config $HADOOP_CONF_DIR start nodemanager
    check_java
}


main() {
    case "$1" in
        "namenode")
            start_namenode
            ;;
        "resourcemanager")
            start_resourcemanager
            ;;
        "historyserver")
            start_historyserver
            ;;
        "slavenode")
            start_slavenode
            ;;
        "datanode")
            start_datanode
            ;;
        "nodemanager")
            start_nodemanager
            ;;
        *)
            exec $@
            exit $?
            ;;
    esac
}


main "$@"
