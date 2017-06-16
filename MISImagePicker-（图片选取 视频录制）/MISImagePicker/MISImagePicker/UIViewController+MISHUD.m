//
//  UIViewController+MISHUD.m
//  MIS
//
//  Created by Maokebing 1/24/15.
//  Copyright (c) 2015 EDU. All rights reserved.
//

#import "UIViewController+MISHUD.h"
#import "MBProgressHUD.h"

@implementation UIViewController(MISHUD)


- (void)showSucessMessage:(NSString *)message {
	[self hideWait];
	
	MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.view];
	[self.view addSubview:hud];
	hud.customView = [[UIImageView alloc]
					  initWithImage:[UIImage imageNamed:@"HUD_success"]];
	hud.mode = MBProgressHUDModeCustomView;
	hud.labelText = message;
	hud.minShowTime = 1.0;
	hud.removeFromSuperViewOnHide = YES;
	[hud show:YES];
	[hud hide:YES];
}


- (void)showInfoMessage:(NSString *)message {
	
	MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.view];
	
	if ([self.view isKindOfClass:[UIWindow class]])
	{
		CGRect frame = hud.frame;
		frame.size.height -= 64.0;
		frame.origin.y += 64.0;
		hud.frame = frame;
	}
	
	[self.view addSubview:hud];
	hud.customView = [[UIImageView alloc]
					  initWithImage:[UIImage imageNamed:@"HUD_info"]];
	hud.mode = MBProgressHUDModeCustomView;
	hud.labelText = message;
	hud.minShowTime = 1.0;
	hud.removeFromSuperViewOnHide = YES;
	[hud show:YES];
	[hud hide:YES];
}

- (void)showErrorMessage:(NSString *)message {
	[self hideWait];
	
	MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.view];
	[self.view addSubview:hud];
	hud.customView = [[UIImageView alloc]
					  initWithImage:[UIImage imageNamed:@"HUD_error"]];
	hud.mode = MBProgressHUDModeCustomView;
	hud.labelText = message;
	hud.minShowTime = 1.0;
	hud.removeFromSuperViewOnHide = YES;
	[hud show:YES];
	[hud hide:YES];
}

- (void)showWaitMessage:(NSString *)message {
	UIView *viewToRemove = nil;
	for (UIView *v in [self.view subviews]) {
		if ([v isKindOfClass:[MBProgressHUD class]]) {
			viewToRemove = v;
		}
	}
	if (viewToRemove != nil) {
		MBProgressHUD *hud = (MBProgressHUD *)viewToRemove;
		hud.removeFromSuperViewOnHide = YES;
		[hud hide:NO];
	}
	
	MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.view];
	hud.labelText = message;
	hud.mode = MBProgressHUDModeIndeterminate;
	
	[self.view addSubview:hud];
	[hud show:YES];
}

- (void)showRequestWait
{
	[self showWaitMessage:@"请求中..."];
}

- (void)showWait
{
	[self showWaitMessage:@"加载中..."];
}


- (void)hideWait {
	UIView *viewToRemove = nil;
	for (UIView *v in [self.view subviews]) {
		if ([v isKindOfClass:[MBProgressHUD class]]) {
			viewToRemove = v;
		}
	}
	if (viewToRemove != nil) {
		MBProgressHUD *hud = (MBProgressHUD *)viewToRemove;
		hud.removeFromSuperViewOnHide = YES;
		[hud hide:YES];
	}
}


- (void)showSucessMessage:(NSString *)message onView:(UIView *)view;
{
    [self hideWait];
    
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    [view addSubview:hud];
    hud.customView = [[UIImageView alloc]
                      initWithImage:[UIImage imageNamed:@"HUD_success"]];
    hud.mode = MBProgressHUDModeCustomView;
    hud.labelText = message;
    hud.minShowTime = 1.0;
    hud.removeFromSuperViewOnHide = YES;
    [hud show:YES];
    [hud hide:YES];
}
- (void)showInfoMessage:(NSString *)message onView:(UIView *)view;
{
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    
    if ([self.view isKindOfClass:[UIWindow class]])
    {
        CGRect frame = hud.frame;
        frame.size.height -= 64.0;
        frame.origin.y += 64.0;
        hud.frame = frame;
    }
    
    [view addSubview:hud];
    hud.customView = [[UIImageView alloc]
                      initWithImage:[UIImage imageNamed:@"HUD_info"]];
    hud.mode = MBProgressHUDModeCustomView;
    hud.labelText = message;
    hud.minShowTime = 1.0;
    hud.removeFromSuperViewOnHide = YES;
    [hud show:YES];
    [hud hide:YES];
}
- (void)showErrorMessage:(NSString *)message onView:(UIView *)view;
{
    [self hideWait];
    
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    [view addSubview:hud];
    hud.customView = [[UIImageView alloc]
                      initWithImage:[UIImage imageNamed:@"HUD_error"]];
    hud.mode = MBProgressHUDModeCustomView;
    hud.labelText = message;
    hud.minShowTime = 1.0;
    hud.removeFromSuperViewOnHide = YES;
    [hud show:YES];
    [hud hide:YES];
}
- (void)showWaitMessage:(NSString *)message onView:(UIView *)view;
{
    UIView *viewToRemove = nil;
    for (UIView *v in [self.view subviews]) {
        if ([v isKindOfClass:[MBProgressHUD class]]) {
            viewToRemove = v;
        }
    }
    if (viewToRemove != nil) {
        MBProgressHUD *hud = (MBProgressHUD *)viewToRemove;
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:NO];
    }
    
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    hud.labelText = message;
    hud.mode = MBProgressHUDModeIndeterminate;
    
    [view addSubview:hud];
    [hud show:YES];
}

@end
