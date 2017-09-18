#/bin/bash
#
# -----============= 环境变量说明 ==============----- #
#
#    SELF_BASE       : 脚本所在目录
#    FILE_SERVER     : 部署文件存储地址IP:PORT
#    DOCK_REGISTRY   : Docker 远程注册中心IP:PORT
#    DOCK_REPOSITORY : Docker 镜像仓库名称
#
# -----=========================================----- #

SELF_BASE=$(dirname $(readlink -f $0))
FILE_SERVER=${FILE_SERVER:-"http://ow5sr4xo5.bkt.clouddn.com"}
DOCK_REGISTRY=${REGISTRY:-"ylzone"}
DOCK_REPOSITORY=jdk8

fileurl=${FILE_SERVER}/deploy/baseprogram/jdk/jdk-8u60-linux-x64.gz
file=${SELF_BASE}/resource/jdk-8u60-linux-x64.gz
filemd5="b8ca513d4f439782c019cb78cd7fd101"

echoEnv() {
    echo "======================= ECHO ENV ======================="
    echo "SELF_BASE       : ${SELF_BASE}"
    echo "FILE_SERVER     : ${FILE_SERVER}"
    echo "DOCK_REGISTRY   : ${DOCK_REGISTRY}"
    echo "DOCK_REPOSITORY : ${DOCK_REPOSITORY}"
    echo "FILE_MD5        : ${filemd5}"
    echo "FILE_PATH       : ${file}"
    echo "========================================================"
}

generateFile() {
    if [ -e $file ]; then
        result=$(md5sum $file | awk '{print $1}')
        [ $result == $filemd5 ] && echo "check file completed !" || rm $file
    fi
    
    if [ ! -e $file ]; then
        wget $fileurl -O $file
    fi
}

buildImage() {
    cd ${SELF_BASE}
    docker build . -t ${DOCK_REGISTRY}/${DOCK_REPOSITORY} && docker push ${DOCK_REGISTRY}/${DOCK_REPOSITORY}
}

main() {
    echoEnv
    generateFile
    buildImage
}

main
