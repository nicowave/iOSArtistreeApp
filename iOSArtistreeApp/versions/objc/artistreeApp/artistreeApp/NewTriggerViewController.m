//
//  NewTriggerViewController.m
//  artistreeApp
//
//  Created by Nicolas Roldos on 6/16/14.
//  Copyright (c) 2014 Artistree. All rights reserved.
//

#import "NewTriggerViewController.h"

@interface NewTriggerViewController ()


@property (strong, nonatomic) IBOutlet UITextField *eventName;
@property (strong, nonatomic) IBOutlet UITextField *notificationDesc;
@property (strong, nonatomic) IBOutlet UITextField *duration;

@property (strong, nonatomic) IBOutlet UIDatePicker *triggerStartDate;

@end

@implementation NewTriggerViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /*NSString *eventTag = self.eventName.text;
    AGSGTTriggerBuilder *builder = [AGSGTTriggerBuilder new];
    builder.tags = @[eventTag];
    builder.notificationText = self.notificationDesc.text;
    NSString *durationString = self.duration.text;
    NSNumberFormatter * durationFormatter = [[NSNumberFormatter alloc] init];
    [durationFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber * durationDays = [durationFormatter numberFromString:durationString];
    builder.fromTimestamp = self.triggerStartDate.date;
    //builder.toTimestamp = self.triggerStartDate.date +durationDays;*/
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
