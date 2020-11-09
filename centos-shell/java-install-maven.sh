#! /bin/shell


#======================================================================
# 快速安装maven shell脚本
# CentOS8 中已成功验证,需要留意授权切换用户
#
# author: zdd
# date: 2020-11-09
#======================================================================

hasMaven(){
    MAVEN_VERSION=$(mvn -version)
    echo "${MAVEN_VERSION}"
    if [[ ! $MAVEN_VERSION ]]
        then
            return 0;
    fi
    return 1;
}

hasMaven

if [ $? != 1 ]
    then
        echo "Not Found maven"
        echo "Installing maven..."

        # 下载并重命名 settings.xml
        sudo wget -v -O settings.xml https://raw.githubusercontent.com/jianiter/tools/master/maven-settings-aliyun.xml

        yum install -y maven

        echo "replace settings..."
        sudo rm -rf /etc/maven/settings.xml
        sudo cp settings.xml /etc/maven/
else
    echo "maven installed."
fi

echo "over"
mvn -version