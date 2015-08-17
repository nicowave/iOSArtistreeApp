//
//  TagsTableViewController.m
//  artistreeApp
//
//  Created by Nicolas Roldos on 6/12/14.
//  Copyright (c) 2014 Artistree. All rights reserved.
//

#import "TagsTableViewController.h"


@interface TagsTableViewController ()

@end

@implementation TagsTableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tagRelation =[[PFUser currentUser] objectForKey:@"tagRelation"];
    PFQuery *query = [self.tagRelation query];
    [query orderByAscending:@"tag"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error) {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        } else {
            self.tagresults = objects;
            
            [self.tableView reloadData];
        }
    }];
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [self.tagresults count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Tag";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    PFObject *tag = [self.tagresults objectAtIndex:indexPath.row];
    [cell.textLabel setText: [tag objectForKey:@"tag"]];
    
    NSLog(@"tag: %@ found!", [tag objectForKey:@"tag"]);
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
  }


@end
