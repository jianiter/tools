###前置准备: 初始化系统

centos 8.2 64位

用户密码权限: root / sudo

>用户授权访问&出入规则
设置安全组规则: ip & port
```
adduser zddlmy
passwd zddlmy
usermod -aG wheel zddlmy 
#CentOS 8上，默认情况下，组wheel的成员被授予sudo访问权限
#su - zddlmy
#whoami
#sudo visudo 自定义username的访问权限

#userdel zddlmy
#userdel -r zddlmy 删除用户并删除其主目录
```

### 安装工具
脚本可通过git下载:https://github.com/jianiter/tools/tree/master/centos-shell

git
>便于clone工具/代码等
```
#sudo dos2unix java-install-git.sh  # 如果遇到此问题时$'\r': command not found,执行dos2unix
$ sudo sh java-install-git.sh #结果 git version 2.18.4
#sudo yum remove git
```

jdk
>通用的版本8
```
#sudo dos2unix java-install-jdk8.sh  # 如果遇到此问题时$'\r': command not found,执行dos2unix
$sudo sh java-install-jdk8.sh #结果 openjdk version "1.8.0_272"
#sudo yum remove java-1.8.0-openjdk
```

maven
>会替换settings中的镜像地址
```
#sudo dos2unix java-install-maven.sh  # 如果遇到此问题时$'\r': command not found,执行dos2unix
$sudo sh java-install-maven.sh #结果 Apache Maven 3.5.4 (Red Hat 3.5.4-5)
#cat /etc/maven/settings.xml 被替换了
#sudo yum remove maven
```

redis
>通用的分布式cache服务,会提示修改密码
```
#sudo dos2unix java-install-redis.sh  # 如果遇到此问题时$'\r': command not found,执行dos2unix
$sudo sh java-install-redis.sh #结果 Redis server v=5.0.3 sha=00000000:0 malloc=jemalloc-5.1.0 bits=64 build=28849dbea6f07cc8
#sudo yum remove redis
#留意# bind 127.0.0.1 ::1
#修改密码 requirepass
#echo 'requirepass $password'>>/etc/redis.conf
#sudo grep -C 5 requirepass /etc/redis.conf
#留意port,设置安全组
#redis-cli 使用
```

mysql
>通用的关系数据库,使用版本8,会提示修改密码
```
#sudo dos2unix java-install-mysql.sh  # 如果遇到此问题时$'\r': command not found,执行dos2unix
$sudo sh java-install-mysql.sh #结果 mysqladmin  Ver 8.0.21 for Linux on x86_64 (Source distribution)

#留意Failed! Error: Your password does not satisfy the current policy requirements
#Estimated strength of the password: 100 
#设置密码复杂度: Zdd521!**&
#mysql -u root -p
#show databases;
#用户验证 caching_sha2_password这个 标准 MySQL 8.0 默认采用的方法
#sudo sed -i s/mysql_native_password/caching_sha2_password/ /etc/my.cnf.d/mysql-default-authentication-plugin.cnf
#sudo cat /etc/my.cnf.d/mysql-default-authentication-plugin.cnf
#sudo yum remove mysql mysql-server mysql-libs
```


