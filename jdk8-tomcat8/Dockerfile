FROM ylzone/jdk7

MAINTAINER ylzone <li.yang@jiangrongxin.com>

ADD /resource/apache-tomcat-7.0.72.tar.gz /opt 

RUN set -x \ 
        && mv /opt/apache-tomcat-7.0.72/ /opt/tomcat7 \
        && echo "version: tomcat-7.0.72" >> /opt/tomcat7/VERSION.md \
        && mv /opt/tomcat7/{conf,conf.orig} \
        && rm -f /opt/tomcat7/{LICENSE,NOTICE,RELEASE-NOTES,RUNNING.txt} \
        && rm -f /opt/tomcat7/bin/*.bat \
        && rm -rf /opt/tomcat7/{logs,temp,webapps,work} \
        && mkdir -p /data/tomcat7/{apps,sbin,conf,data,logs,vars,back} \
        && mkdir -p /data/tomcat7/vars/{run,tmp,wap,wrk} \
        && mkdir -p /data/tomcat7/vars/wap/ROOT \
        && cp /opt/tomcat7/conf.orig/* /data/tomcat7/conf \
        && echo 'Index Successful!' > /data/tomcat7/vars/wap/ROOT/index.html \
        && touch /data/tomcat7/sbin/startup \
        && touch /data/tomcat7/sbin/setenv.sh        

COPY resource/conf/server.xml /data/tomcat7/conf
COPY resource/conf/startup   /data/tomcat7/sbin
COPY resource/conf/setenv.sh /data/tomcat7/sbin

RUN set -x \
        && chmod +x /data/tomcat7/sbin/startup

EXPOSE 8080

CMD ["/data/tomcat7/sbin/startup", "run"]
