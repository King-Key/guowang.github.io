---
title: tf faster-rcnn(三)实现目标检测(cpu)训练自己的数据
date: 2019-08-17 22:28:22
categories: 计算机视觉
tags: 
- tf faster-rcnn 
- 目标检测 
- 深度学习
---


> 在前两篇博客中我们分别[配置了环境](https://blog.csdn.net/King_key/article/details/84781608)和进行了[demo的测试](https://blog.csdn.net/King_key/article/details/84900581),接下来我们训练自己的图像数据并进行检测.

<!-- more -->

### 制作数据集

我们采用VOC2007的数据模板,进行数据制作

- VOC2007数据文件图:
```shell
VOC2007
├── Annotations    #图像标签文件,是.xml格式
├── ImageSets   
│   ├── Layout
│   ├── Main    #训练和测试用到的数据文件
│   └── Segmentation
└── JPEGImages   #图像文件
#Layout和Segmentation文件在这里不需要
```
- 采用[labelimg](https://github.com/tzutalin/labelImg)进行图像标记.可以[下载](https://pan.baidu.com/s/1t3usWCqnkgN7NtGyvNVPCw),直接运行可能会出现错误,先根据项目网址中的提示安装依赖文件,再运行.
  
  1. 修改data/predefined_classes.txt文件,改成自己的类名.
  
  2. 运行程序,界面如下图所示:
  
  ![在这里插入图片描述](https://img-blog.csdnimg.cn/20181228160926475.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0tpbmdfa2V5,size_16,color_FFFFFF,t_70)    
  
  3. 点击Change Save Dir修改标签文件的保存目录.
  
  4. 点击Open Dir ,打开图片路径.
  
  5. 点击图片进行标注,如下图:
  
  ![在这里插入图片描述](https://img-blog.csdnimg.cn/20181228162049732.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0tpbmdfa2V5,size_16,color_FFFFFF,t_70)
  详细的使用可以参考网上的其他说明.至此,标签数据我们已经做好.我们将制作的数据按照VOC2007的格式进行放入.
  
  6. 生成训练,测试数据.在这里,我们利用代码来生成:
  
  ```shell
  import os
  import random
  
  def _main():
      trainval_percent = 0.5
    train_percent = 0.5
      xmlfilepath = 'Annotations'
      total_xml = os.listdir(xmlfilepath)
  
      num = len(total_xml)
      list = range(num)
      tv = int(num * trainval_percent)
    tr = int(tv * train_percent)
      trainval = random.sample(list, tv)
      train = random.sample(trainval, tr)
  
      ftrainval = open('ImageSets/Main/trainval.txt', 'w')
    ftest = open('ImageSets/Main/test.txt', 'w')
      ftrain = open('ImageSets/Main/train.txt', 'w')
      fval = open('ImageSets/Main/val.txt', 'w')
  
       for i in list:
          name = total_xml[i][:-4] + '\n'
          if i in trainval:
              ftrainval.write(name)
              if i in train:
                  ftest.write(name)
              else:
                  fval.write(name)
          else:
              ftrain.write(name)
      ftrainval.close()
      ftrain.close()
      fval.close()
      ftest.close()
      
  if __name__ == '__main__':
      _main()
  ```
  
  7. 将程序文件放在VOC2007文件夹下(本人是按照这个路径进行编写的),其中trainval_percent与 train_percent可以根据需要修改,随后执行,会生成四个文件:
  
  ```shell
  /ImageSets/Main$ tree
  .
  ├── test.txt
  ├── train.txt
  ├── trainval.txt
  └── val.txt
  ```
  
  8. 在VOC数据中,对图像的像素比例有一定的要求,因此我们将图像进行修改.代码如下:
  
  ```shell
  import cv2
  import os
  
     file_path='./JPEGImages/'
     for filename in os.listdir(file_path):
  
      print(filename)
      img=cv2.imread(file_path+filename)
    
     size=cv2.resize(img,(500,375))
     cv2.imwrite(file_path+filename,size)
     if img is not None:
     	continue
  ```

  现在,我们自己的数据集总算是完成了,将制作好的数据集与原先的数据进行替换,就可以开始训练自己的模型了.

### 训练自己的数据模型

- 在lib/pascal_voc.py文件中,修改类别参数
    ```python
    self._classes = ('__background__',  # always index 0
                     '#自己的类名')
    ```
- 在train_faster_rcnn.sh和test_faster_rcnn.sh修改
    ```python 
    ITEMS=#自己设置,本人设置为10000
    ```
- 在项目根目录下执行
    ```shell
    ./experiments/scripts/train_faster_rcnn.sh 0 pascal_voc_0712 res101
    ```
- 此时会生成:
    ```shell
    output #生成的训练模型
    └── res101
        ├── voc_2007_test
        │   └── default
        │       └── res101_faster_rcnn_iter_100
        │           ├── detections.pkl
        │           ├── license_pr.pkl
        │           └── _pr.pkl
        └── voc_2007_trainval+voc_2012_trainval
            └── default
                ├── checkpoint
                ├── res101_faster_rcnn_iter_10000.ckpt.data-00000-of-00001
                ├── res101_faster_rcnn_iter_10000.ckpt.index
                ├── res101_faster_rcnn_iter_10000.ckpt.meta
                ├── res101_faster_rcnn_iter_10000.pkl

    tensorboard #可视化文件,可利用命令tensorboard --logdir=tensorborad/res101进行可视化观察
    └── res101
        └── voc_2007_trainval+voc_2012_trainval
            ├── default
            │   ├── events.out.tfevents.1545706608.guo-ThinkPad-E550
            │   ├── events.out.tfevents.1545711447.guo-ThinkPad-E550
            │   ├── events.out.tfevents.1545732554.guo-ThinkPad-E550
            │   └── events.out.tfevents.1545818970.guo-ThinkPad-E550
            └── default_val
                ├── events.out.tfevents.1545706693.guo-ThinkPad-E550
                ├── events.out.tfevents.1545711504.guo-ThinkPad-E550
                ├── events.out.tfevents.1545732622.guo-ThinkPad-E550
                └── events.out.tfevents.1545819033.guo-ThinkPad-E550
    ```

### 然后,就是测试了

修改demo.py

- 修改类名
```python
CLASSES = ('__background__',
           '#自己的类')
```
- 修改模型
```python
NETS = {'vgg16': ('vgg16_faster_rcnn_iter_70000.ckpt',),'res101': ('res101_faster_rcnn_iter_10000.ckpt',)}#其中的10000,是我自己的训练设置,个人要根据自己的设置修改,一定要和初始设置的参数一致
```
- 修改测试图片
原文是:
```python
im_names=['#demo中图片的名称']
```
本人进行了修改,遍历文件夹下所有的图片进行读取,修改代码如下
```python
im_path='#图片文件的路径'
im_names = os.listdir(im_path)
#这里的im_path是以项目的根路径进行设置的,此时如果你读取的不是demo或者demo下的文件夹,那就需要再修改一处
#im_file = os.path.join(cfg.DATA_DIR, 'demo', image_name)其中的demo就要根据自己的进行修改
```
- 执行测试,执行命令
```shell
./tools/demo.py
```
在这里,如果图片太多,或者不想显示的时候,可以进行结果的保存,添加一行代码,如下:
```python 
demo(sess,net,im_name)
plt.savefig('./../data/demo-show/'+im_name)
#前面是路径,demo-show文件需要自己创建,也是以项目的根路径进行设置的
#im_name是图片原本的名称,所以在保存的时候,如果还是在测试图片的文件下进行保存,会被覆盖
```
### 最后,就是小小的庆祝一下,总算是完成了...

这是本人自己的记录,其中可能遇到和大家不一样的问题,的如果有什么疑问,可以下方留言讨论!!!!

