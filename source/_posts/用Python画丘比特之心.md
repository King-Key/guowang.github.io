---
title: 用Python画丘比特之心
date: 2019-08-22 07:56:47
categories: Python
tags:
- Python
- 心
---

> Python语言真的是无所不能，作为一种程序语言，也有属于自己的浪漫，今天，我们用Python来画一个丘比特之心，向你喜欢的人展现程序员的浪漫！

<!--more-->

#### 1. 需要的扩展包

```shell
Turtle
PyGame
```

- ``` Turtle ```是一个很好用的绘图扩展，可以去通过指令控制坐标点的移动。[官网链接]([http://www.pythonturtle.org](http://www.pythonturtle.org/))　这个是我们今天需要用到的工具
- ``` PyGame```是``` Python```里面的游戏扩展包，可以用来写游戏，不过这次我们用这个来添加背景音乐

#### 2. 安装

Python下的安装就只需要一条命令就可以解决，很是方便

```shell
pip install turtle
pip install pygame
```

#### 3.重头戏：画心

话不多说，上代码

```python
#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Date    : 2019-08-11 21:34:13
# @Author  : WangGuo
# @GitHub  : https://github.com/King-Key
# @Blog    : https://blog.csdn.net/King_key
# @Emeil   : guo_wang_113@163.com

import turtle
import time
import pygame

#添加音乐
def add_music(path):
	pygame.mixer.init()
	track = pygame.mixer.music.load(path)
	pygame.mixer.music.play()
	time.sleep(2)

# 画心形圆弧
def hart_arc():
	for i in range(200):
		turtle.right(1)
		turtle.forward(2)
def move_pen_position(x, y):
	turtle.hideturtle()
	turtle.up()　#提起画笔
	turtle.goto(x, y)　#修改落点
	turtle.down()　#放下画笔
	turtle.showturtle()

#心
def love(self_x,self_y,self_left):
	turtle.setup(width=900, height=600)　#控制起始位置
	turtle.color('red', 'pink')
	turtle.pensize(5)
	turtle.speed(50)
	# 初始化画笔起始坐标
	move_pen_position(x=self_x,y=self_y)
	turtle.left(self_left)
	turtle.begin_fill()
	# 画心形直线（ 左下方 ）
	turtle.forward(224)
	# 画爱心圆弧
	hart_arc()
	turtle.left(120)
	hart_arc()
	# 画心形直线（ 右下方 ）
	turtle.forward(224)
	turtle.end_fill()

#文字
def text(txt,x,y,color,):
	move_pen_position(x,y)
	turtle.hideturtle()
	turtle.color(color, 'pink')
	turtle.write(txt, font=('Arial', 30, 'bold'), align="center")

#箭
def arrow():
	turtle.pencolor('red')　#控制颜色
	turtle.pensize(20) 　#控制画笔大小
	turtle.speed(20)　#控制速度

	move_pen_position(x=-400,y=-80)
	turtle.right(205)
	turtle.forward(850)

	move_pen_position(x=410,y=155)
	turtle.right(45)
	turtle.forward(25)
	turtle.right(90)
	turtle.forward(25)

	move_pen_position(x=660,y=-130)


if __name__ == '__main__':
	path="用Python画丘比特之心/咱们结婚吧-齐晨.mp3"
	add_music(path)

	love(self_x=170,self_y=-140,self_left=140)
	love(self_x=-170,self_y=-200,self_left=280)

	text('老婆',180,90,'#CD5C5C')
	text('老公',-160,20,'red')
	arrow()

	# 点击窗口关闭程序
	window = turtle.Screen()
	window.exitonclick()
```

``` turtle```的用法并不难，不过却很方便，具体的函数可以去官网上看看

最后给大家看一下效果图,当然图片里面是听不到音乐的了

![1566433454275](./用Python画丘比特之心/1566433454275.png)