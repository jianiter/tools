#! /bin/shell


#======================================================================
# 快速安装redis shell脚本
# CentOS8 中已成功验证,建议设置开机自启动
#
# author: zdd
# date: 2020-11-09
#======================================================================

hasRedis(){
    RESULT=$(redis-server -v)
    echo "${RESULT}"
    if [[ ! $RESULT ]]
        then
            return 0;
    fi
    return 1;
}

hasRedis

if [ $? != 1 ]
    then
        echo "Not Found redis"
        echo "Installing redis..."

        sudo yum install epel-release
        sudo yum update

        yum install redis
        
        read -p "edit redis.conf,please input password:" password
        # 采用末尾追加方式
        echo "requirepass $password">>/etc/redis.conf
        echo "your password is :$password"

        systemctl enable redis
        systemctl start redis
else
    echo "redis installed."
fi

echo "over"
redis-server --version


