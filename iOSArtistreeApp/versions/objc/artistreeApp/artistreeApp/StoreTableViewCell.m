//
//  StoreTableViewCell.m
//  artistreeApp
//
//  Created by Nicolas Roldos on 7/1/14.
//  Copyright (c) 2014 Artistree. All rights reserved.
//

#import "StoreTableViewCell.h"

@implementation StoreTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
