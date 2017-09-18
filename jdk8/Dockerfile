FROM centos:7
MAINTAINER ylzone <li.yang@jiangrongxin.com>

ENV TIME_ZONE Asia/Shanghai
ENV JAVA_HOME /usr/java/default
ENV PATH=$PATH:$JAVA_HOME/bin

RUN set -x \
        && echo "${TIME_ZONE}" > /etc/timezone \
        && ln -sf /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime 

ADD resource/jdk-8u60-linux-x64.gz /usr/java

RUN set -x \
        && ln -s /usr/java/jdk1.8.0_60/ /usr/java/latest \
        && ln -s /usr/java/latest /usr/java/default

CMD ["/bin/bash"]
