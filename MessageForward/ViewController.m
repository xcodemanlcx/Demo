//
//  ViewController.m
//  MessageForward
//
//  Created by leichunxiang on 2019/4/5.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "ViewController.h"
#import "MessageR.h"
#import "MessageRClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //对象的方法
    MessageR *messageR = [[MessageR alloc] init];
    [messageR performSelector:@selector(instanceFunction)];
    
    //类方法
//    [MessageRClass performSelector:@selector(classFunction)];
}


@end
