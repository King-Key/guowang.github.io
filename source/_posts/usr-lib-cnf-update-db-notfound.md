---
title: '/usr/lib/cnf-update-db:notfound'
date: 2020-07-01 00:38:53
categories: 经验
tags:
- 经验
- Ubuntu更新报错
---

>Ubuntu系统``` sudo apt update```报错



<!--more-->

#### 问题描述

```powershell
sudo apt update
```

终端执行之后，出现下面的报错信息

```powershell
dpkg:警告:无法找到软件包"xxx"的文件名列表文件

sh: 1: /usr/lib/cnf-update-db: not found
正在读取软件包列表... 完成
E: Problem executing scripts APT::Update::Post-Invoke-Success 'if /usr/bin/test -w /var/lib/command-not-found/ -a -e /usr/lib/cnf-update-db; then /usr/lib/cnf-update-db > /dev/null; fi'
E: Sub-process returned an error code
```

#### 解决方案

1、网上的参考方案，没有解决问题

```powershell
 sudo mv /var/lib/dpkg/info /var/lib/dpkg/info_old
 sudo mkdir /var/lib/dpkg/info
 sudo apt update && apt -f install 
 sudo apt -f install 
 sudo mv /var/lib/dpkg/info/* /var/lib/dpkg/info_old
 sudo rm -rf /var/lib/dpkg/info 
 sudo mv /var/lib/dpkg/info_
 sudo mv /var/lib/dpkg/info_old /var/lib/dpkg/info
 sudo apt update
```

2、这是解决问题的方法

```powershell
sudo apt-get --reinstall install `dpkg --get-selections | grep '[[:space:]]install' | cut -f1`
```



