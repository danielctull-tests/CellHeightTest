//
//  Cell.m
//  CellHeightTest
//
//  Created by Daniel Tull on 10/08/2014.
//  Copyright (c) 2014 Daniel Tull. All rights reserved.
//

#import "Cell.h"
#import "TextView.h"

@interface Cell () <UITextViewDelegate>
@property (nonatomic, weak) IBOutlet TextView *textView;
@property (nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *marginConstraints;
@end

@implementation Cell

- (void)setTextView:(TextView *)textView {
	_textView = textView;
	_textView.textContainerInset = UIEdgeInsetsMake(15.0f, 15.0f, 15.0f, 15.0f);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize
		withHorizontalFittingPriority:(UILayoutPriority)horizontalFittingPriority
			  verticalFittingPriority:(UILayoutPriority)verticalFittingPriority {

	CGFloat cellWidth = CGRectGetWidth(self.bounds);
	CGFloat contentWidth = CGRectGetWidth(self.contentView.bounds);
	CGFloat contentDifference = cellWidth - contentWidth;
	CGFloat margin = [[self.marginConstraints valueForKeyPath:@"@sum.constant"] floatValue];
	self.textView.preferredMaxLayoutWidth = targetSize.width - contentDifference - margin;
	[self.textView invalidateIntrinsicContentSize];

	CGSize size =  [super systemLayoutSizeFittingSize:targetSize
						withHorizontalFittingPriority:horizontalFittingPriority
							  verticalFittingPriority:verticalFittingPriority];

	NSLog(@"SIZE: %@", NSStringFromCGSize(size));
	return size;

}

#pragma mark - UITextViewDelegate

- (void)textViewDidChange:(UITextView *)textView {
	[self.delegate cellDidUpdate:self];
}

@end
