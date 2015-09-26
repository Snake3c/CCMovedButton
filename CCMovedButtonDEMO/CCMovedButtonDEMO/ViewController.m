//
//  ViewController.m
//  CCMovedButtonDEMO
//
//  Created by cc on 15/9/26.
//  Copyright © 2015年 Snake. All rights reserved.
//

#import "ViewController.h"
#import "CCMovedBtn.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CCMovedBtn *btn = [CCMovedBtn new];
    [btn setImage:[UIImage imageNamed:@"girl" ] forState:UIControlStateNormal];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
