#! /bin/shell


#======================================================================
# 快速安装GIT
# CentOS8 中已成功验证
# 使用yum方式安装
#
# author: zdd
# date: 2020-11-09
#======================================================================

hasGit(){
    GIT_VERSION=$(git --version)
    echo "${GIT_VERSION}"
    if [[ $GIT_VERSION == *version* ]]
        then
            return 1;
    fi
    return 0;
}

hasGit

if [ $? != 1 ]
    then
        echo "Not Found git"
        echo "Installing Git..."
        yum install -y git  
else
    echo "git installed." 
fi


echo "over"
git --version
