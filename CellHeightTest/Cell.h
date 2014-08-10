//
//  Cell.h
//  CellHeightTest
//
//  Created by Daniel Tull on 10/08/2014.
//  Copyright (c) 2014 Daniel Tull. All rights reserved.
//

@import UIKit;

@protocol CellDelegate;

@interface Cell : UITableViewCell
@property (nonatomic, weak) id<CellDelegate> delegate;
@end


@protocol CellDelegate <NSObject>

- (void)cellDidUpdate:(Cell *)cell;

@end