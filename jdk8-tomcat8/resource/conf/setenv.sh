#--============================================--#
#                   环境相关
#--============================================--#
export JAVA_HOME="/usr/java/default"
export CATALINA_OUT="$CATALINA_BASE"/logs/catalina.out
export CATALINA_PID="$CATALINA_BASE"/vars/run/tomcat8.pid
export CATALINA_TMPDIR="$CATALINA_BASE"/vars/tmp


#--============================================--#
#                 JVM资源相关
#--============================================--#
CATALINA_OPTS="-server -Xmx400m -Xms400m
               -XX:MaxPermSize=128m -XX:PermSize=128m
               -XX:+UseParallelGC -XX:ParallelGCThreads=4"


#--============================================--#
#    开启JXM功能 (**注意修改hostname及端口**)
#--============================================--#
#CATALINA_OPTS="$CATALINA_OPTS
# -Djava.rmi.server.hostname=VM01
# -Dcom.sun.management.jmxremote=true
# -Dcom.sun.management.jmxremote.port=18080
# -Dcom.sun.management.jmxremote.ssl=false
# -Dcom.sun.management.jmxremote.authenticate=false"


#--============================================--#
#                开启GC日志
#--============================================--#
CATALINA_OPTS="$CATALINA_OPTS
 -XX:+PrintGCDateStamps
 -XX:+PrintGCDetails
 -Xloggc:${CATALINA_BASE}/logs/gc/gc.log"


#--============================================--#
#                开启HeapDump
#--============================================--#
CATALINA_OPTS="$CATALINA_OPTS
 -XX:+HeapDumpOnOutOfMemoryError
 -XX:HeapDumpPath=${CATALINA_BASE}/logs/dump/heapdump.bin"
