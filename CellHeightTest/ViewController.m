//
//  ViewController.m
//  CellHeightTest
//
//  Created by Daniel Tull on 10/08/2014.
//  Copyright (c) 2014 Daniel Tull. All rights reserved.
//

#import "ViewController.h"
#import "Cell.h"

@interface ViewController () <CellDelegate>
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.tableView.rowHeight = UITableViewAutomaticDimension;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 100.0f;
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
	
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	Cell *cell = (Cell *)[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
	cell.delegate = self;
	return cell;
}

#pragma mark - CellDelegate

- (void)cellDidUpdate:(Cell *)cell {
	[self.tableView beginUpdates];
	[self.tableView endUpdates];
}

@end
