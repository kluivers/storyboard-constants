//
//  JBWMasterViewController.m
//  IdentifierTest
//
//  Created by Joris Kluivers on 10/02/14.
//  Copyright (c) 2014 Joris Kluivers. All rights reserved.
//

#import "JBWMasterViewController.h"

#import "JBWDetailViewController.h"

#import "JBWStoryboardIdentifiers.h"

@interface JBWMasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation JBWMasterViewController

- (IBAction) buttonAction:(id)sender
{
    [self performSegueWithIdentifier:JBWShowDetailIdentifier sender:nil];
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    cell.textLabel.text = NSLocalizedString(@"Some example item", nil);
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = _objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

@end
