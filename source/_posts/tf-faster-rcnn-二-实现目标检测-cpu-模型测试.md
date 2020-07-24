---
title: tf faster-rcnn(二)实现目标检测(cpu)模型测试
date: 2019-08-17 20:01:58
categories: 计算机视觉
tags: 
- tf faster-rcnn 
- 目标检测 
- 深度学习
---

> 继CPU下运行demo之后，现在开始使用res101进行voc数据的训练

<!--more-->

(1)在tf-faster-rcnn根目录下，执行：
```shell
NET=res101
TRAIN_IMDB=voc_2007_trainval+voc_2012_trainval
mkdir -p output/${NET}/${TRAIN_IMDB}
cd output/${NET}/${TRAIN_IMDB}
ln -s ../../../data/voc_2007_trainval+voc_2012_trainval ./default
cd ../../..
```
(2)下载res101模型，并建立软连接
```shell
mkdir -p data/imagenet_weights
cd data/imagenet_weights
wget -v http://download.tensorflow.org/models/resnet_v1_101_2016_08_28.tar.gz
tar -xzvf resnet_v1_101_2016_08_28.tar.gz
mv resnet_v1_101.ckpt res101.ckpt
cd ../..
```
(3)下载[voc数据集](https://pan.baidu.com/s/16cFYzwuIDaOc09ExReHHTA)（提取码: 3a8y），并修改名称
```shell
mv VOCdevkit VOCdevkit2007
```
(4)运行（运行的参数中是GPU运行的参数设置，但是在经过第一次的修改后，为gpu_id参数设置为0的话，也是可以运行的）
```shell
./experiments/scripts/test_faster_rcnn.sh 0 pascal_voc_0712 res101
```



