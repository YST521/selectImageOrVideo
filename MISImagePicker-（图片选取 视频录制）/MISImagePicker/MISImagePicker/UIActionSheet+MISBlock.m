//
//  UIActionSheet+Block.m
//  EDU
//
//  Created by Maokebing 3/11/15.
//  Copyright (c) 2015 EDU. All rights reserved.
//

#import "UIActionSheet+MISBlock.h"

const void *UIActionSheetCompletionKey = "UIActionSheetCompletionKey";

@implementation UIActionSheet(Block)

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
	void (^completion)(NSInteger buttonIndex) = objc_getAssociatedObject(self, UIActionSheetCompletionKey);
	
	if(completion == nil)
		return;
	
	completion(buttonIndex);
}

-(void)config:(void(^)(NSInteger buttonIndex))completion
{
	if(completion != nil)
	{
		self.delegate = self;
		objc_setAssociatedObject(self, UIActionSheetCompletionKey, completion, OBJC_ASSOCIATION_COPY);
	}
}

-(void)showInView:(UIView *)view
	   completion:(void (^)(NSInteger buttonIndex))completion {
	UIActionSheet *sheet = (UIActionSheet *)self;
	[self config:completion];
	[sheet showInView:view];
}

-(void)showFromToolbar:(UIToolbar *)view
			completion:(void (^)(NSInteger buttonIndex))completion {
	[self config:completion];
	[self showFromToolbar:view];
}


-(void)showFromTabBar:(UITabBar *)view
		   completion:(void (^)(NSInteger buttonIndex))completion {
	[self config:completion];
	[self showFromTabBar:view];
}


-(void)showFromRect:(CGRect)rect
			 inView:(UIView *)view
		   animated:(BOOL)animated
		 completion:(void (^)(NSInteger buttonIndex))completion {
	[self config:completion];
	[self showFromRect:rect inView:view animated:animated];
}


-(void)showFromBarButtonItem:(UIBarButtonItem *)item
					animated:(BOOL)animated
				  completion:(void (^)(NSInteger buttonIndex))completion {
	[self config:completion];
	[self showFromBarButtonItem:item animated:animated];
}


@end
