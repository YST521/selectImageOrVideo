//
//  UIAlertView+Block.m
//  EDU
//
//  Created by Maokebing 4/16/15.
//  Copyright (c) 2015 Eduapp. All rights reserved.
//

#import "UIAlertView+MISBlock.h"
#import <objc/runtime.h>

const void *UIAlertViewCompletionKey = "UIAlertViewCompletionKey";

@implementation UIAlertView(Block)

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
	void (^completion)(NSInteger buttonIndex) = objc_getAssociatedObject(self, UIAlertViewCompletionKey);
	
	if(completion == nil)
		return;
	
	completion(buttonIndex);
}

- (void)showWithCompletion:(void (^)(NSInteger))completion {
	if(completion != nil)
	{
		self.delegate = self;
		objc_setAssociatedObject(self, UIAlertViewCompletionKey, completion, OBJC_ASSOCIATION_COPY);
	}
	
	[self show];
}

@end
