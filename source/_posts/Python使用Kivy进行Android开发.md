---
title: Python使用Kivy进行Android开发
date: 2019-10-03 12:28:54
categories: Python
tags:
- Kivy
- Android开发
- Ubuntu
---

> Python作为一种万能语言，有什么不能“盘”的。今天利用Kivy使用Python进行Android开发，写一个"Hello world"程序。

<!--more-->

#### 安装相应的软件

- kivy：编写程序的包文件

```shell
sudo pip install kivy
```

- buildozer：用来编译生成APP文件

```shell
sudo pip install buildozer
```

- openjdk-8-jdk 

```shell
sudo apt-get install openjdk-8-jdk 
```

#### 编写一个简单的"hello world"程序

- 首先创建一个main.py文件

```python
from kivy.app import App
class HelloAPP(App):
	pass

if __name__ == '__main__':
	HelloAPP().run()
```

- 创建一个hello.kv文件

```kivy
Label:
	text:'hello world!'
```

#### 执行测试

- 本地执行：文件目录下执行python main.py,显示如下

![](https://img-blog.csdnimg.cn/20191005115958562.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0tpbmdfa2V5,size_16,color_FFFFFF,t_70)

- 生成APP文件执行

  ```shell
  #首先在文件目录下执行
  buildozer init 
  #执行下面这句时，因为要下载一些东西，所以会比较慢
  buildozer android debug deplay run 
  ```

  