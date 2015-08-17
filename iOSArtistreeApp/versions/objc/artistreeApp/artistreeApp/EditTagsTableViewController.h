//
//  EditTagsTableViewController.h
//  artistreeApp
//
//  Created by Nicolas Roldos on 6/16/14.
//  Copyright (c) 2014 Artistree. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface EditTagsTableViewController : UITableViewController

@property (nonatomic, strong) PFUser *currentUser;

@property (nonatomic, strong) NSArray *allTags;

@end
