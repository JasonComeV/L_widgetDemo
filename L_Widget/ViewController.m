//
//  ViewController.m
//  L_Widget
//
//  Created by 魏亮 on 2017/3/27.
//  Copyright © 2017年 魏亮. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSUserDefaults *shared = [[NSUserDefaults alloc] initWithSuiteName:@"group.wwwasd"];
    
    [shared setObject:@"111111111" forKey:@"widget"];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
