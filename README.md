# Docker Hadoop

This image provides Docker containers for Hadoop including support for Alluxio.

## Building

This Hadoop build also includes support for Alluxio. But since as of today no Alluxio build is available for the Hadoop
version of this image (Hadoop 2.8.0), a custom built Alluxio client is installed. It can be built from Alluxio  1.4 via
    
    mvn clean install -Dhadoop.version=2.8.0 -DskipTests=true
    
## Configuration

The Hadoop image provides lots of configuration options. The most important ones are:

    HDFS_NAMENODE_PORT=8020
    HDFS_NAMENODE_HOSTNAME=hadoop-namenode
    HDFS_DEFAULT_FS=hdfs://hadoop-namenode:8020
    HDFS_DATANODE_DIRS=/mnt/dataNode1,/mnt/dataNode2
    HDFS_NAMENODE_DIRS=/mnt/nameNode1,/mnt/nameNode2

    YARN_RESOURCEMANAGER_HOSTNAME=hadoop-resourcemanager
    YARN_NODEMANAGER_CORES=32
    YARN_NODEMANAGER_MEMORY=65536
    YARN_NODEMANAGER_LOCALDIRS

    MAPRED_HISTORYSERVER_HOSTNAME=hadoop-historyserver


# Deployment

## Minimum Configuration

You need to specify at least the following environment variables:

    YARN_RESOURCEMANAGER_HOSTNAME=hadoop-resourcemanager
    MAPRED_HISTORYSERVER_HOSTNAME=hadoop-historyserver
    YARN_NODEMANAGER_CORES=32
    YARN_NODEMANAGER_MEMORY=65536
    HDFS_NAMENODE_HOSTNAME=hadoop-namenode
    
Then you can setup a complete Hadoop cluster using the following commands:
    
* namenode - Runs Hadoop Namenode
* resourcemanager - Runs Hadoop Resource Manager
* historyserver - Runs Hadoop History Server
* slavenode - Runs a Hadoop slave node containg node manager and data node

You require exactly one namenode and one resourcemanager and at least one slavenode. You can scale up by running
multiple slave nodes.

## S3 properties

Since many users want to access data stored on AWS S3, it is also possible to specify AWS credentials and general
settings.

    S3_PROXY_HOST=
    S3_PROXY_PORT=-1
    S3_PROXY_USE_HTTPS=false
    S3_ENDPOINT=s3.amazonaws.com
    S3_ENDPOINT_HTTP_PORT=80
    S3_ENDPOINT_HTTPS_PORT=443

    AWS_ACCESS_KEY_ID=
    AWS_SECRET_ACCESS_KEY=
