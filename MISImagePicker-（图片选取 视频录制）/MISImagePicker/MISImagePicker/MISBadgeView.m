//
//  MISBadageLabel.m
//  EDU
//
//  Created by Maokebing 3/12/15.
//  Copyright (c) 2015 Eduapp. All rights reserved.
//

#import "MISBadgeView.h"

@interface MISBadgeView()
@property(nonatomic, strong) UILabel* label;
@end

@implementation MISBadgeView


- (instancetype)init {
	if ((self = [super init])) {
		self.hidden = YES;
		
		self.label = [[UILabel alloc] init];
		self.label.translatesAutoresizingMaskIntoConstraints = NO;
		self.label.backgroundColor = [UIColor clearColor];
		self.label.font = [UIFont systemFontOfSize:14.0f];
		self.label.textColor = [UIColor whiteColor];
		self.label.textAlignment = NSTextAlignmentCenter;
		
		
		self.layer.cornerRadius = 10.0f;
		self.clipsToBounds = YES;
		
		[self addSubview:self.label];
		
		NSDictionary* views = @{@"label":self.label};
		NSString* hf1 = @"H:|-5-[label(>=10)]-5-|";
		NSString* vf1 = @"V:|[label(>=20)]|";
		
		[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:hf1 options:0 metrics:0 views:views]];
		[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vf1 options:0 metrics:0 views:views]];
	}
	return self;
}

+ (MISBadgeView *)autoLayoutBadgeView {
	MISBadgeView* label = [[MISBadgeView alloc] init];
	label.translatesAutoresizingMaskIntoConstraints  = NO;
	return label;
}

- (void)setBadgeValue:(NSInteger )badgeValue {
	if (_badgeValue != badgeValue) {
		
		_badgeValue = badgeValue;
		
		if (_badgeValue > 0 && _badgeValue <= 99) {
			self.label.text = @(_badgeValue).stringValue;
			self.hidden = NO;
		}
		else if(_badgeValue > 99) {
			self.label.text = @"99+";
			self.hidden = NO;
		}
		else {
			self.hidden = YES;
		}
	}
}

/**
 *  设置徽标值
 *
 *  @param badgeValue 0 时隐藏
 *  @param flag       是否有动画
 */
- (void)setBadgeValue:(NSInteger)badgeValue animated:(BOOL)flag {
	self.badgeValue = badgeValue;
	
	if (flag) {
		//动画
		CAKeyframeAnimation *k = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
		k.values = @[@(0.1),@(1.0),@(1.2)];
		k.keyTimes = @[@(0.0),@(0.5),@(0.8),@(1.0)];
		k.calculationMode = kCAAnimationLinear;
		[self.layer addAnimation:k forKey:@"SHOW"];
	}
}


@end
