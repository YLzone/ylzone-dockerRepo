FROM ylzone/jdk8

MAINTAINER ylzone <li.yang@jiangrongxin.com>

ADD /resource/apache-tomcat-8.0.39.tar.gz /opt 

RUN set -x \ 
        && mv /opt/apache-tomcat-8.0.39/ /opt/tomcat8 \
        && echo "version: tomcat-8.0.39" >> /opt/tomcat8/VERSION.md \
        && mv /opt/tomcat8/{conf,conf.orig} \
        && rm -f /opt/tomcat8/{LICENSE,NOTICE,RELEASE-NOTES,RUNNING.txt} \
        && rm -f /opt/tomcat8/bin/*.bat \
        && rm -rf /opt/tomcat8/{logs,temp,webapps,work} \
        && mkdir -p /data/tomcat8/{apps,sbin,conf,data,logs,vars,back} \
        && mkdir -p /data/tomcat8/vars/{run,tmp,wap,wrk} \
        && mkdir -p /data/tomcat8/vars/wap/ROOT \
        && cp /opt/tomcat8/conf.orig/* /data/tomcat8/conf \
        && echo 'Index Successful!' > /data/tomcat8/vars/wap/ROOT/index.html \
        && touch /data/tomcat8/sbin/startup \
        && touch /data/tomcat8/sbin/setenv.sh        

COPY resource/conf/server.xml /data/tomcat8/conf
COPY resource/conf/startup   /data/tomcat8/sbin
COPY resource/conf/setenv.sh /data/tomcat8/sbin

RUN set -x \
        && chmod +x /data/tomcat8/sbin/startup

EXPOSE 8080

CMD ["/data/tomcat8/sbin/startup", "run"]
