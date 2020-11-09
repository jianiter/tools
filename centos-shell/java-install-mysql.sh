#! /bin/shell


#======================================================================
# 快速安装MySQL
# CentOS8 中已成功验证,建议开机自启动
#
# author: zdd
# date: 2020-11-09
#======================================================================

hasMysql(){
    RESULT=$(mysqladmin --version)
    echo "${RESULT}"
    if [[ ! $RESULT ]]
	    then
	        return 0;
	fi
    return 1;
}

hasMysql

if [ $? != 1 ]
	then
		echo "Not Found mysql"
	    echo "Installing mysql..."

		sudo dnf install @mysql

		# 启动mysql服务
		sudo systemctl enable --now mysqld
		sudo systemctl status mysqld


		# 重置密码 , 可选择级别,根据提示操作,建议全选Y
		sudo mysql_secure_installation

		# 用户验证 ,替换成caching_sha2_password
		#sudo vim /etc/my.cnf.d/mysql-default-authentication-plugin.cnf
		echo 'replace authentication:caching_sha2_password'
		sudo sed -i s/mysql_native_password/caching_sha2_password/ /etc/my.cnf.d/mysql-default-authentication-plugin.cnf
		#mysql -u root -p
else
	echo "Mysql installed."
fi

echo "over"
mysqladmin --version