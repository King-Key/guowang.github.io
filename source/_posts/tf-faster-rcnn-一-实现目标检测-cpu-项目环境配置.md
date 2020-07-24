---
title: tf faster-rcnn(一)实现目标检测(cpu)项目环境配置
date: 2019-08-17 19:56:38
categories: 计算机视觉
tags: 
- tf faster-rcnn 
- 目标检测 
- 深度学习
---


> 系统环境说明：Ubuntu18.04
<!--more-->

- 下载项目

  ```
  git clone https://github.com/endernewton/tf-faster-rcnn.git
  ```

- 编译,配置相应的运行环境

  - 安装Cpython (这里相应的模块需要根据个人平时的使用下载，有很多的本人电脑已经存在，便没有一一列举出来)

    ```shell
    sudo apt-get install cpython
    ```

  - 修改项目，改为cpu运行

    【1】打开lib->model->config.py,查看第236行(本人的)，实际修改是将__C.USE_GPU_NMS的値由True修改为False.
    作用：禁用gpu,使用cpu进行计算

    【2】打开lib->model->nms_wrapper.py，进行注释，第12行

    【3】打开lib->setup.py，进行注释，第55行，第120-136行

  - 进入项目的lib目录中执行 
    ```shell
     make ```
  ```
    
  - 安装Python COCO API,使用coco数据集

    ```shell
    cd data
    git clone https://github.com/pdollar/coco.git		
    cd coco/PythonAPI
    make
    ```

- 运行demo和训练

  - 下载预训练模型[voc_0712_80k-110k.tgz](https://pan.baidu.com/s/1kWkF3fT )
    放在data文件目录下，解压.

  - 建立训练模型的软连接,data文件目录下进行

    ```shell
    NET=res101
    TRAIN_IMDB=voc_2007_trainval+voc_2012_trainval
    mkdir -p output/${NET}/${TRAIN_IMDB}
    cd output/${NET}/${TRAIN_IMDB}
    ln -s ../../../voc_2007_trainval+voc_2012_trainval ./default
    cd ../../..
    ```

  - 运行demo

    data目录文件下

    ```python
    ../tools/demo.py
    ```

