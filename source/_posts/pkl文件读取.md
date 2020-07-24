---
title: .pkl文件文件读取
date: 2019-08-19 22:58:56
categories: Python
tags:  
- Python
- pkl
---

> .pkl文件是Python的文件格式

<!--more-->

##### 1. 根据网上查阅的读取方法

```pyth
import pickle
file=open("./dataset-cornell-length10-filter1-vocabSize40000.pkl","rb")
data=pickle.load(file)
print(data)
file.close()
```

在这里，注意在读取的使用的是"rb",也就是二进制文件格式，而"r"是普通格式的读取

用print输出结果显示是这样的

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190819234548841.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0tpbmdfa2V5,size_16,color_FFFFFF,t_70)

。。。。。。。好吧，全是数字，这怎么看呢

##### 2. 再来看看第二种

```pyth
import pickle
import pprint

file=open("./dataset-cornell-length10-filter1-vocabSize40000.pkl","rb")
data=pickle.load(file)
pprint.pprint(data)
file.close()
```

好吧，读取的方式是一样的，但是显示出来的是不一样的，看看显示

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190819234601553.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0tpbmdfa2V5,size_16,color_FFFFFF,t_70)

明显这个才是我们可以的认识的，恩，就是这样