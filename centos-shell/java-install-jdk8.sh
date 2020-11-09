#! /bin/shell


#======================================================================
# 快速安装JDK
# CentOS8 中已成功验证
# 使用yum方式安装
#
# author: zdd
# date: 2020-11-09
#======================================================================

#sudo yum remove java-1.8.0-openjdk
echo "Installing jdk..."
yum install -y java-1.8.0-openjdk

echo "over"
java -version


