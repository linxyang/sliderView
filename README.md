# sliderView
##一个类似档位调节的控件。

* 这是项目中用到的，用来调节硬件功率级别的控件，主要是采用了手势来处理的，顺便分享给大家。
* 采用block回调的方式返回档位或级别


```
PowerAdjustView *powerView = [[PowerAdjustView alloc] initWithPowerGradeChangeBlock:^(PowerGradeType gradeType) {
        NSLog(@"滑动到了档位:%zd",gradeType);
    }];

```
![image](https://github.com/linxyang/sliderView/blob/master/1.gif)



