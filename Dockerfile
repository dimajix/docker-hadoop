FROM dimajix/jre:oracle-8
MAINTAINER k.kupferschmidt@dimajix.de

ARG BUILD_HADOOP_VERSION=2.8.5

# Set Hadoop and Java environment
ENV HADOOP_HOME=/opt/hadoop \
	HADOOP_PREFIX=/opt/hadoop \
	HADOOP_CONF_DIR=/etc/hadoop \
    HADOOP_LOG_DIR=/var/log/hadoop \
    HADOOP_YARN_HOME=/opt/hadoop \
    YARN_LOG_DIR=/var/log/yarn \
    HTTPFS_HOME=/opt/hadoop \
    HTTPFS_LOG=/var/log/httpfs

# Download and install Hadoop
RUN curl -sL http://www.eu.apache.org/dist/hadoop/common/hadoop-${BUILD_HADOOP_VERSION}/hadoop-${BUILD_HADOOP_VERSION}.tar.gz \
    | tar -xz -C /opt \
    && ln -s hadoop-${BUILD_HADOOP_VERSION} ${HADOOP_PREFIX} \
    && ln -s ${HADOOP_PREFIX}/etc/hadoop /etc/hadoop \
    && ln -s $HADOOP_HOME/share/hadoop/tools/lib/jackson-annotations-2.*.jar $HADOOP_HOME/share/hadoop/common/lib \
    && ln -s $HADOOP_HOME/share/hadoop/tools/lib/jackson-core-2.*.jar $HADOOP_HOME/share/hadoop/common/lib \
    && ln -s $HADOOP_HOME/share/hadoop/tools/lib/jackson-databind-2.*.jar $HADOOP_HOME/share/hadoop/common/lib \
    && ln -s $HADOOP_HOME/share/hadoop/tools/lib/hadoop-aws-*.jar $HADOOP_HOME/share/hadoop/common/lib \
    && ln -s $HADOOP_HOME/share/hadoop/tools/lib/aws-java-sdk-*.jar $HADOOP_HOME/share/hadoop/common/lib \
    && ln -s $HADOOP_HOME/share/hadoop/tools/lib/joda-time-*.jar $HADOOP_HOME/share/hadoop/common/lib \
    && mkdir -p ${HADOOP_LOG_DIR} \
    && mkdir -p ${YARN_LOG_DIR} \
    && mkdir -p ${HTTPFS_LOG} \
    && rm -rf $HADOOP_HOME/share/doc

# download and install Hadoop native support
#RUN rm -rf $HADOOP_PREFIX/lib/native \
#    && mkdir -p $HADOOP_PREFIX/lib/native \
#    && curl -L https://github.com/sequenceiq/docker-hadoop-build/releases/download/v${BUILD_HADOOP_VERSION}/hadoop-native-64-${BUILD_HADOOP_VERSION}.tgz | tar -xz -C $HADOOP_PREFIX/lib/native

# copy configs and binaries
COPY bin/ /opt/docker/bin/
COPY libexec/ /opt/docker/libexec/
COPY conf/ /opt/docker/conf/hadoop/

# setup environment
ENV PATH=$PATH:$HADOOP_HOME/bin \
    LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HADOOP_HOME/lib/native

ENTRYPOINT ["/opt/docker/bin/entrypoint.sh"]
CMD bash
