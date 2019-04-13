//
//  ViewController.m
//  MessageForward
//
//  Created by leichunxiang on 2019/4/5.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "ViewController.h"
#import "MessageR.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //对象的方法
//    MessageR *messageR = [[MessageR alloc] init];
//    [messageR performSelector:@selector(instanceFunction)];
    
    //类方法
//    [MessageR performSelector:@selector(classFunction)];
    __weak typeof(self) weakSelf = self;
    void (^block)(void) = ^{
        NSLog(@"%@",weakSelf);
    };
    
}


@end
