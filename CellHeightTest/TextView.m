//
//  TextView.m
//  CellHeightTest
//
//  Created by Daniel Tull on 10/08/2014.
//  Copyright (c) 2014 Daniel Tull. All rights reserved.
//

#import "TextView.h"

@implementation TextView

- (CGSize)intrinsicContentSize {

	CGSize max = CGSizeMake(self.preferredMaxLayoutWidth, CGFLOAT_MAX);
	CGSize size = CGSizeZero;

	NSString *text = self.text;
	if (text.length == 0) {
		self.text = @"A";
		size = [self sizeThatFits:max];
		self.text = text;
	} else {
		size = [self sizeThatFits:max];
	}

	NSLog(@"%@", NSStringFromCGSize(size));

	return size;
}

@end
