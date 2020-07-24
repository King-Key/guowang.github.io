---
title: ubuntu进入initramfs
date: 2020-07-01 00:14:06
categories: 经验
tags:
- ubuntu
- 系统错误
- 经验
---

> Ubuntu系统开机进入initramfs，可能是因为不正常的关闭系统造成的问题

<!--more-->

#### 解决方案

##### 1、重启系统，进入Ubuntu(高级选项)，修复模式（recovery mode）

##### 2、执行命令

```powershell
fsck -t ext4 /dev/sda4

// 后面的/dev/sda4是进入recovery mode后，系统会提示哪个磁盘出现问题，选择相应的即可
```

##### 3、全选“yes”，最后重启即可

