//
//  MessageR.m
//  MessageForward
//
//  Created by leichunxiang on 2019/4/5.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "MessageR.h"
#import "RuntimeTool.h"
#import "SpareReceiver.h"
#import <objc/runtime.h>


@interface MessageR ()


-(void)instanceFunction;
//    NSLog(@"备用类的对象方法testFunction");



@end

//-(void)classFunction{
//    NSLog(@"备用类的类方法testClassFunction");
//}

@implementation MessageR

#pragma mark - 1 动态方法解析
+(BOOL)resolveClassMethod:(SEL)sel{
//    if (sel == NSSelectorFromString(classFun)) {
//        [RuntimeTool addMethodForClass:[RuntimeTool getMetaClassWithClass:self]
//                                   sel:sel
//                                impSel:NSSelectorFromString(@"addClassDynamicMethod")];
//        return NO;
//    }
   return [super resolveClassMethod:sel];
}

+(BOOL)resolveInstanceMethod:(SEL)sel{
    return [super resolveInstanceMethod:sel];
}
#pragma mark - 2 备用接收者

+(id)forwardingTargetForSelector:(SEL)sel{
//    if (sel == NSSelectorFromString(classFun)) {
////        SpareReceiver *s = [[SpareReceiver alloc] init];
//        return [SpareReceiver class];
//    }
    return [super forwardingTargetForSelector:sel];
}

#pragma mark - 3 完整转发

+(NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
    if (sel == NSSelectorFromString(classFun)) {
//        NSMethodSignature * sign = [NSMethodSignature signatureWithObjCTypes:"v@:"];
//        BackupTestMessage * backUp = [BackupTestMessage new];
        NSMethodSignature * sign = [SpareReceiver methodSignatureForSelector:sel];
        return sign;
    }
    return [super methodSignatureForSelector:sel];
}

+(void)forwardInvocation:(NSInvocation *)anInvocation{
    
    //创建备用对象
//    SpareReceiver * spareReceiver = [[SpareReceiver alloc] init];
    SEL sel = anInvocation.selector;
    
    
    //是否响应sel
    if ([SpareReceiver respondsToSelector:sel]) {
        [anInvocation invokeWithTarget:[SpareReceiver class]];
    }else{
        [self doesNotRecognizeSelector:sel];
    }
}

#pragma mark - runtime动态添加的方法

-(void)addDynamicMethod{
    NSLog(@"动态添加,对象方法");
}

+(void)addClassDynamicMethod{
    NSLog(@"动态添加，类方法");
}

@end
