//
//  EditTagsTableViewController.m
//  artistreeApp
//
//  Created by Nicolas Roldos on 6/16/14.
//  Copyright (c) 2014 Artistree. All rights reserved.
//

#import "EditTagsTableViewController.h"



@interface EditTagsTableViewController ()


@end

@implementation EditTagsTableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    PFQuery *query = [PFQuery queryWithClassName:@"tagslist"];
    [query whereKey:@"app" equalTo:@"artistreeApp"];
    
    [query orderByAscending:@"tag"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error){
        if (error) {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        } else {
            self.allTags = objects;
            NSLog(@"%@ ", self.allTags);
            [self.tableView reloadData];
        }
    }];
    
    self.currentUser = [PFUser currentUser];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [self.allTags count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Tag";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    PFObject *tag = [self.allTags objectAtIndex:indexPath.row];
    [cell.textLabel setText:[tag objectForKey:@"tag"]];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    PFRelation *tagRelation = [self.currentUser relationForKey:@"tagRelation"];
    PFObject *tag = [self.allTags objectAtIndex:indexPath.row];
    [tagRelation addObject:tag];
    [self.currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (error) {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        } else {
            
        }
    }];
}




@end
