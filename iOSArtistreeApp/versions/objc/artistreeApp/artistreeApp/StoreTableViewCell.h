//
//  StoreTableViewCell.h
//  artistreeApp
//
//  Created by Nicolas Roldos on 7/1/14.
//  Copyright (c) 2014 Artistree. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoreTableViewCell : UITableViewCell


@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *distanceLabel;
@property (strong, nonatomic) IBOutlet UIImageView *thumbImage;

@end
