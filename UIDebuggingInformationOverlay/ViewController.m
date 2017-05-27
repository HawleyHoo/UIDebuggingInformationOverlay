//
//  ViewController.m
//  UIDebuggingInformationOverlay
//
//  Created by 胡杨 on 2017/5/27.
//  Copyright © 2017年 net.fitcome.www. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+Debugging.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewHierarchy {
    
#ifdef DEBUG
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    id debugClass = NSClassFromString(@"UIDebuggingInformationOverlay");
    [debugClass performSelector:NSSelectorFromString(@"prepareDebuggingOverlay")];
    
    id debugOverlayInstance = [debugClass performSelector:NSSelectorFromString(@"overlay")];
    [debugOverlayInstance performSelector:NSSelectorFromString(@"toggleVisibility")];
#pragma clang diagnostic pop
#endif


}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    [self viewHierarchy];
//    [self showDebugger];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
