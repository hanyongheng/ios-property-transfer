//
//  ViewController.m
//  PropertyTransfer
//
//  Created by pingan001 on 2017/9/14.
//  Copyright © 2017年 pingan001hyh. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController ()<passValueDelegate>

@property(nonatomic,strong)UILabel* lable;
@property(nonatomic,strong)UIButton* btn;

@end

@implementation ViewController


-(UILabel*) lable{
    
    if (_lable==nil) {
        _lable=[[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 40)];
        _lable.backgroundColor=[UIColor blackColor];
        _lable.textColor=[UIColor whiteColor];
        _lable.font=[UIFont systemFontOfSize:20];
    }
    return _lable;
}

-(UIButton*)btn{
    
    if (_btn==nil) {
        
        _btn=[[UIButton alloc] initWithFrame:CGRectMake(100, 300, 200, 40)];
        _btn.backgroundColor=[UIColor redColor];
        [_btn setTitle:@"跳转到页面2" forState:UIControlStateNormal];
        [_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _btn;
}

//btn 点击事件--跳转到页面2
-(void)btnClick{
    
    
    SecondViewController* nextVc=[[SecondViewController alloc] init];
    //代理反向传值 设置代理
//    nextVc.delegate=self;
    
    //block反向传值 实现某个类的block属性
    nextVc.block=^(NSString* valueBlo){
        NSLog(@"block 传值");
        self.lable.text=valueBlo;
    };
    nextVc.str=@"属性传值";
    [[NSUserDefaults standardUserDefaults] setObject:@"NSUserDefaults传值" forKey:@"NSUserDefaults"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self presentViewController:nextVc animated:YES completion:nil];
}

//遵守协议方法
-(void)passValue:(NSString *)value{
    
    self.lable.text=value;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.lable];
    [self.view addSubview:self.btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
