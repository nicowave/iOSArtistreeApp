//
//  StoreTableViewController.h
//  artistreeApp
//
//  Created by Nicolas Roldos on 6/23/14.
//  Copyright (c) 2014 Artistree. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <GeotriggerSDK/AGSGTGeotriggerManager.h>
#import "Store.h"



@interface StoreTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate>



@property (strong, nonatomic) NSMutableArray *storeNames;
@property (strong, nonatomic) NSMutableArray *distancesToStores;
@property (strong, nonatomic) NSArray *storeImages;



@end
