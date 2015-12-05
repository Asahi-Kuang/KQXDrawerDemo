#README
####参照QQ侧边抽屉效果Demo,提供OC和Swift两个版本
####版本：
#####Swift: KXXDrawer_Swift
#####Objective-C: KQXDrawer
---
####Author:==Asahi_Kuang== QQ:==375961900== E-Mail:==asahikuang@yahoo.com==
###version: 1.0v
---
###使用的技术点：
###1.两个控制器，一个主控制器，一个侧边滑动控制器。
###2. 动画的组合使用。
###3.分离UITableView的dataSource。
###4.手势控制。
---
###内含文件说明：
####Objective-C:
####1. LeftViewController.h/m  左边滑出控制器处理
####2. MainViewController.h/m  主界面控制器处理
####3. LeftSliceViewController.h/m 协调处理两个控制器，管理动画效果等
####4. ArrayDataSource.h/m     分离出来的dataSource处理完成
####5. Headers.h 宏定义管理
####6. KQXDrawerPrefix.pch PCH文件
---
####Swift:
####1. LeftViewController.swift  左边滑出控制器处理
####2. MainViewController.swift  主界面控制器处理
####3. LeftSlideViewController.swift 协调处理两个控制器，管理动画效果等
####4. ArrayDataSource.swift     分离出来的dataSource处理完成
---
#####效果图(Swift):

![pic link](http://a3.qpic.cn/psb?/V106iJhq3r5pvo/s*G5MmJ0xoaP19uL0acEdNATfMzXJI9lrBlhxoYVL7I!/b/dFsBAAAAAAAA&bo=0gFHA9IBRwMCMhY!&rf=viewer_4)

截图：
![pic link](http://r.photo.store.qq.com/psb?/V106iJhq3r5pvo/1prwS5D1nrqpNERbKHQkk8B3cz.QVa9IHmjqcywT1Cc!/o/dHIAAAAAAAAA&bo=gAJyBO4CNgUDAA4!&rf=viewer_4)


![pic link](http://r.photo.store.qq.com/psb?/V106iJhq3r5pvo/EKsTZODa74XvIaKXepIRSe*IJLhwLm4Z35U7hjwDmsY!/o/dFsBAAAAAAAA&bo=gAJyBO4CNgUDAA4!&rf=viewer_4)