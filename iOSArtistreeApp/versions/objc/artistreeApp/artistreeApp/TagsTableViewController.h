//
//  TagsTableViewController.h
//  artistreeApp
//
//  Created by Nicolas Roldos on 6/12/14.
//  Copyright (c) 2014 Artistree. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface TagsTableViewController : UITableViewController

@property (nonatomic, strong) NSArray *tagresults;
@property (nonatomic, strong) PFRelation *tagRelation;

@end
