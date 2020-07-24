---
title: hexo 提交报错
date: 2019-08-22 23:47:09
categories: 经验
tags:
- hexo
- Next
---

> hexo在编译的时候报错TypeError: Cannot read property 'count' of undefined

<!-- more -->

#### 报错的具体信息

```shell
FATAL Something's wrong. Maybe you can find the solution here: https://hexo.io/docs/troubleshooting.html
TypeError: Cannot read property 'count' of undefined
    at Hexo.module.exports (/home/guo/Work/hexo/node_modules/hexo-baidu-url-submit/lib/generator.js:4:41)
    at Hexo.tryCatcher (/home/guo/Work/hexo/node_modules/bluebird/js/release/util.js:16:23)
    at Hexo.<anonymous> (/home/guo/Work/hexo/node_modules/bluebird/js/release/method.js:15:34)
    at /home/guo/Work/hexo/node_modules/hexo/lib/hexo/index.js:318:20
    at tryCatcher (/home/guo/Work/hexo/node_modules/bluebird/js/release/util.js:16:23)
    at MappingPromiseArray._promiseFulfilled (/home/guo/Work/hexo/node_modules/bluebird/js/release/map.js:61:38)
    at MappingPromiseArray.PromiseArray._iterate (/home/guo/Work/hexo/node_modules/bluebird/js/release/promise_array.js:114:31)
    at MappingPromiseArray.init (/home/guo/Work/hexo/node_modules/bluebird/js/release/promise_array.js:78:10)
    at MappingPromiseArray._asyncInit (/home/guo/Work/hexo/node_modules/bluebird/js/release/map.js:30:10)
    at _drainQueueStep (/home/guo/Work/hexo/node_modules/bluebird/js/release/async.js:142:12)
    at _drainQueue (/home/guo/Work/hexo/node_modules/bluebird/js/release/async.js:131:9)
    at Async._drainQueues (/home/guo/Work/hexo/node_modules/bluebird/js/release/async.js:147:5)
    at Immediate.Async.drainQueues [as _onImmediate] (/home/guo/Work/hexo/node_modules/bluebird/js/release/async.js:17:14)
    at processImmediate (internal/timers.js:439:21)

```

#### 解决方法是删除``` hexo-baidu-url-submit```

```shell
npm remove hexo-baidu-url-submit
```

然后清除配置，重新编译提交就可以了

```shell
hexo clean
hexo g
hexo d
```



