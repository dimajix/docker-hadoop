#!/bin/bash

# HDFS Properties
export HDFS_NAMENODE_HOSTNAME=${HDFS_NAMENODE_HOSTNAME=hadoop-namenode}
export HDFS_NAMENODE_PORT=${HDFS_NAMENODE_PORT=8020}
export HDFS_DEFAULT_FS=${HDFS_DEFAULT_FS=hdfs://$HDFS_NAMENODE_HOSTNAME:$HDFS_NAMENODE_PORT}
export HDFS_DATANODE_DIRS=${HDFS_DATANODE_DIRS=/mnt/dataNode1,/mnt/dataNode2}
export HDFS_NAMENODE_DIRS=${HDFS_NAMENODE_DIRS=/mnt/nameNode1,/mnt/nameNode2}
export HDFS_REPLICATION_FACTOR=${HDFS_REPLICATION_FACTOR=2}

# YARN Properties
export YARN_RESOURCEMANAGER_HOSTNAME=${YARN_RESOURCEMANAGER_HOSTNAME=hadoop-resourcemanager}
export YARN_NODEMANAGER_LOCALDIRS=${YARN_NODEMANAGER_LOCALDIRS=/mnt/nodeManager1/intermediate,/mnt/nodeManager2/intermediate}
export YARN_NODEMANAGER_LOGDIRS=${YARN_NODEMANAGER_LOGDIRS=/mnt/nodeManager1/logs,/mnt/nodeManager2/logs}
export YARN_NODEMANAGER_CORES=${YARN_NODEMANAGER_CORES=32}
export YARN_NODEMANAGER_MEMORY=${YARN_NODEMANAGER_MEMORY=65536}
export YARN_NODEMANAGER_PMEM_CHECK_ENABLED=${YARN_NODEMANAGER_PMEM_CHECK_ENABLED=true}
export YARN_NODEMANAGER_VMEM_CHECK_ENABLED=${YARN_NODEMANAGER_VMEM_CHECK_ENABLED=true}
export YARN_NODEMANAGER_VMEM_PMEM_RATIO=${YARN_NODEMANAGER_VMEM_PMEM_RATIO=2.1}
export YARN_SCHEDULER_MAXIMUM_ALLOCATION_MB=${YARN_SCHEDULER_MAXIMUM_ALLOCATION_MB=131072}

export MAPREDUCE_HISTORYSERVER_HOSTNAME=${MAPREDUCE_HISTORYSERVER_HOSTNAME=hadoop-historyserver}

# S3 properties
export S3_PROXY_HOST=${S3_PROXY_HOST}
export S3_PROXY_PORT=${S3_PROXY_PORT}
export S3_PROXY_USE_HTTPS=${S3_PROXY_USE_HTTPS=false}
export S3_ENDPOINT=${S3_ENDPOINT=s3.amazonaws.com}
export S3_ENDPOINT_HTTP_PORT=${S3_ENDPOINT_HTTP_PORT=80}
export S3_ENDPOINT_HTTPS_PORT=${S3_ENDPOINT_HTTPS_PORT=443}

export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
