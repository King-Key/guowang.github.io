---
title: Pyinstaller打包程序
date: 2019-10-05 11:35:01
categories: Python
tags:
- Pyinstaller
- .exe
- 程序打包
---

> 写好程序后，利用Pyinstaller将程序打包为可执行文件

<!--more-->

#### 安装Pyinstaller

```shell
pip install pyinstaller
```

#### 程序打包

进入程序的根目录下，单个程序文件的话，执行

```shell
pyinstaller -F *.py

#-F :将程序打包为一个文件
# *.py是指程序文件名
```

这样打包出来的程序文件有一个问题，就是特别的大，因为在打包的时候将所有的包都打包进取了，不可取！

#### 利用pipenv进行程序打包

- 安装pipenv

```shell
pip install pipenv
```

- 创建虚拟环境，可以指定python版本

```shell
pipenv install 
```

- 启动环境

```shell
pipenv shell
```

- 安装需要的依赖，如pyinstaller

```shell
pipenv install pyinstaller
```

此时可以利用pip list查看环境中python的依赖，比较干净了，此时就可以利用pyinstaller进行打包了

```shell
pyinstaller -F *.py
```

然后就会发现此时的程序文件会小很多，具体的pipenv和pyinstaller用法，可以参考官网！！！