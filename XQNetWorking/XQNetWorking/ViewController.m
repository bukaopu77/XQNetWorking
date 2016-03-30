//
//  ViewController.m
//  XQNetWorking
//
//  Created by 周剑 on 16/3/27.
//  Copyright © 2016年 bukaopu. All rights reserved.
//

#import "ViewController.h"
#import "XQNetWorking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *urlString = @"http://img2.2345.com/duoteimg/qqbiaoqing/150908087030/14.gif";
    
    XQNetWorking *net = [XQNetWorking sharedNetworking];
    [net GET:urlString params:nil progress:^(NSProgress *progress) {
        NSLog(@"%@", progress);
    } success:^(NSURLSessionDataTask *task, id responder) {
        [task suspend];
        NSLog(@"responder----%@", responder);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [task suspend];
        NSLog(@"%@", error);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
