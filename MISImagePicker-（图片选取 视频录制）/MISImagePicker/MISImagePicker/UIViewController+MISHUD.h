//
//  UIViewController+MISHUD.h
//  MIS
//
//  Created by Maokebing 1/24/15.
//  Copyright (c) 2015 EDU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController(MISHUD)

- (void)showSucessMessage:(NSString *)message;
- (void)showInfoMessage:(NSString *)message;
- (void)showErrorMessage:(NSString *)message;
- (void)showWaitMessage:(NSString *)message;
- (void)showRequestWait;
- (void)showWait;
- (void)hideWait;

//-------------show message on specified view--------------------------added by chenlei-2016.4.18-------------
- (void)showSucessMessage:(NSString *)message onView:(UIView *)view;
- (void)showInfoMessage:(NSString *)message onView:(UIView *)view;
- (void)showErrorMessage:(NSString *)message onView:(UIView *)view;
- (void)showWaitMessage:(NSString *)message onView:(UIView *)view;

@end
