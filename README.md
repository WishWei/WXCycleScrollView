# WXCycleScrollView
WXCycleScrollView is a scrollable image banner using Swift

![screenshot](http://upload-images.jianshu.io/upload_images/1792565-9663cc87b634bd81.gif?imageMogr2/auto-orient/strip)
# Requirements
* iOS 10.0 or later
* Swift 3.0

# Installation
WXCycleScrollView can be installed using CocoaPods.Add following to your Podfile.
```
pod 'WXCycleScrollView', '~> 1.2.0'
```

# Usage
Instance WXCycleScrollView and set WXCycleScrollViewDelegate,set images by setting property images,set web image by setting imageUrlStrs,and set titles by setting titles.
```
    cycleScrollView = WXCycleScrollView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 240))
    cycleScrollView?.delegate = self
    cycleScrollView?.imageStrs = imageStrs
    cycleScrollView?.titles = titles
```
Implement func in WXCycleScrollViewDelegate to deal with the click event on image.
``` 
    func cycleScrollView(_ cycleScrollView: WXCycleScrollView, didSelectAt index: Int) {
        //your code
    }
```
