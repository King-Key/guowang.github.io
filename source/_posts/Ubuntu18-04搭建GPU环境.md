---
title: Ubuntu18.04搭建GPU环境
date: 2019-09-12 12:19:23
categories: 经验
tags:
- Ubuntu18.04
- TensorFlow-gpu
- 经验
- 环境配置
---

> Ubuntu18.04下配置TensorFlow-gpu环境

<!--more-->

关于GPU的环境配置已经不是第一次了，Ubuntu上或是在Windows上，但是每次都会遇到各种各样的问题。好吧，其实环境配置的步骤都差不多，在这里我之说明在安装过程中主要遇到的问题。

#### 环境

电脑：dell G7系列

系统：Ubuntu18.04

驱动：NVIDIA 435

CUDA：10.1

CUDNN：7.6

TensorFLow-gpu：1.14

#### 安装

- 驱动安装，可以使用Ubuntu系统自带的"软件和更新"->"附加驱动"进行安装。

- 然后就是CUDA安装，也是按照正常的安装命令进行安装就可以。

- CUDNN复制拷进cuda的安装目录

- 最后tensorflow安装

  ```shell
  pip install tensorflow-gpu
  ```

#### 问题

最大的问题就是**安全启动**选项的问题，不知道是不是dell系统的设置问题。

windows系统的启动必须设置安全启动选项，但是在ubuntu系统下，设置了安全启动选项后，无法与NVIDIA驱动进行通信，这是遇到的最大问题。目前每次切换系统都需要县设置安全启动选项，这就很难受了。

