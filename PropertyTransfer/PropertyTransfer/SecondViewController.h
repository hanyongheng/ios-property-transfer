//
//  SecondViewController.h
//  PropertyTransfer
//
//  Created by pingan001 on 2017/9/14.
//  Copyright © 2017年 pingan001hyh. All rights reserved.
//

#import <UIKit/UIKit.h>

//委托方创建一个协议
@protocol passValueDelegate <NSObject>

//定义一个传值的方法
-(void)passValue:(NSString*)value;

@end

@interface SecondViewController : UIViewController

@property(nonatomic,strong)NSString* str;

//委托方持有协议的引用

@property(weak)id<passValueDelegate>delegate;

//定义一个block进行页面反向传值
@property(copy)void(^block)(NSString* s);

@end
