//
//  ViewController.m
//  汉字转拼音
//
//  Created by mac on 16/1/13.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
{
    UITextField *_textF;
    UILabel *_label;
    UILabel *_label1;

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self _createSubViews];
}

- (void)_createSubViews
{
    _textF = [[UITextField alloc]initWithFrame:CGRectMake(50, 100, 100, 30)];
    _textF.backgroundColor = [UIColor redColor];
    _textF.placeholder = @"llll";
    _textF.delegate = self;
    [self.view addSubview:_textF];
    
    _label = [[UILabel alloc]initWithFrame:CGRectMake(50, 200, 100, 30)];
    _label.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_label];
    
    _label1 = [[UILabel alloc]initWithFrame:CGRectMake(50, 300, 100, 30)];
    _label1.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_label1];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 150, 50, 30)];
    [btn setBackgroundColor: [UIColor orangeColor]];
    [btn addTarget:self action:@selector(tapAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)tapAction
{
    if (_textF.text.length) {
        NSMutableString *mS = [[NSMutableString alloc]initWithString:_textF.text];
        if (CFStringTransform((__bridge CFMutableStringRef)mS, 0, kCFStringTransformMandarinLatin, NO)) {
            //带声调
            NSLog(@"pinyin1:%@",mS);
            _label.text = mS;

        }
        if (CFStringTransform((__bridge CFMutableStringRef)mS, 0, kCFStringTransformStripDiacritics, NO)) {
            //去声调
            NSLog(@"pinyin2:%@",mS);
            _label1.text = mS;

        }
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
