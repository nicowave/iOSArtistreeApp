//
//  TaggedStoreTableViewController.m
//  artistreeApp
//
//  Created by Nicolas Roldos on 6/17/14.
//  Copyright (c) 2014 Artistree. All rights reserved.
//

#import "TaggedStoreTableViewController.h"


@interface TaggedStoreTableViewController ()

@end

@implementation TaggedStoreTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    PFQuery *query = [PFQuery queryWithClassName:@"storeInfo"];
    [query whereKey:@"tag" equalTo:@"artistree"];
    
    
    // either add record store information to Parse or pull from feature service
    [query orderByAscending:@"name"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error){
        if (error) {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        } else {
            self.allStores = objects;
            NSLog(@"%@ ", self.allStores);
            [self.tableView reloadData];
        }
    }];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
   return [self.allStores count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Store";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    PFUser *store = [self.allStores objectAtIndex:indexPath.row];
    [cell.textLabel setText:[store objectForKey:@"*"]];

    
    return cell;
}






@end
