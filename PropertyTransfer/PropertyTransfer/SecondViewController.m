//
//  SecondViewController.m
//  PropertyTransfer
//
//  Created by pingan001 on 2017/9/14.
//  Copyright © 2017年 pingan001hyh. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property(nonatomic,strong)UITextField* textFiled;
@property(nonatomic,strong)UIButton* btn;

@end

@implementation SecondViewController

-(UITextField*)textFiled{
    
    if (!_textFiled) {
        _textFiled=[[UITextField alloc]initWithFrame:CGRectMake(100, 100, 200, 40)];
        _textFiled.textColor=[UIColor blackColor];
        _textFiled.borderStyle=UITextBorderStyleLine;
        _textFiled.text=self.str;
        _textFiled.text=[[NSUserDefaults standardUserDefaults] objectForKey:@"NSUserDefaults"];
    }
    return _textFiled;
}


-(UIButton*)btn{
    
    if (_btn==nil) {
        
        _btn=[[UIButton alloc] initWithFrame:CGRectMake(100, 300, 200, 40)];
        _btn.backgroundColor=[UIColor redColor];
        [_btn setTitle:@"跳转回页面1" forState:UIControlStateNormal];
        [_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _btn;
}

//btn 点击事件--跳转到页面2
-(void)btnClick{
    
//    [self.delegate passValue:@"代理方式反向传值"];
    self.block(self.textFiled.text);
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:self.textFiled];
    [self.view addSubview:self.btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
