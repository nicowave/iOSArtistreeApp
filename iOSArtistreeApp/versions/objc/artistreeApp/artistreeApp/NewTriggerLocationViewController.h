//
//  NewTriggerLocationViewController.h
//  artistreeApp
//
//  Created by Nicolas Roldos on 6/17/14.
//  Copyright (c) 2014 Artistree. All rights reserved.
//

#import "NewTriggerViewController.h"
#import "AAppTriggerDetails.h"

#import <UIKit/UIKit.h>
#import <GeotriggerSDK/AGSGTApiClient.h>
#import <GeotriggerSDK/AGSGTTriggerBuilder.h>
#import <GeotriggerSDK/AGSGTGeotriggerManager.h>
#import <CoreLocation/CLGeocoder.h>
#import <CoreLocation/CoreLocation.h>



@interface NewTriggerLocationViewController : UIViewController <UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate, CLLocationManagerDelegate, CLLocationManagerDelegate>

{
    IBOutlet UIScrollView *scroller;
}



//trigger location and size disctionary

//location buttons
@property (weak, nonatomic) IBOutlet UISwitch *useDefaultsSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *useStoreLocationIDSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *useCurrentLocationSwitch;


//text fields
//store details, tag name, push notification event details
@property (strong, nonatomic) IBOutlet UITextField *storeName;
@property (strong, nonatomic) IBOutlet UITextField *storeId;
@property (strong, nonatomic) IBOutlet UITextField *eventTag;
@property (strong, nonatomic) IBOutlet UITextField *eventDescription;

//for geocoding
@property (strong, nonatomic) IBOutlet UITextField *address;
@property (strong, nonatomic) IBOutlet UITextField *city;
@property (strong, nonatomic) IBOutlet UITextField *zip;


//start and end date/time for event
@property (weak, nonatomic) IBOutlet UIDatePicker *eventEndDate;
@property (weak, nonatomic) IBOutlet UILabel *startDate;
@property (weak, nonatomic) IBOutlet UILabel *startTime;


//trigger size
@property (strong, nonatomic) IBOutlet UISlider *distanceSlider;

//button to confirm trigger size
@property (weak, nonatomic) IBOutlet UIBarButtonItem *triggerDistanceButton;



//button for use of current location to set trigger latitude and longitude
@property (weak, nonatomic) IBOutlet UISwitch *currentLocationSwitch;




//event Tag action
- (IBAction)setEventTag:(UITextField *)sender;




//event Description action
- (IBAction)setEventDescription:(UITextField *)sender;

- (IBAction)confirmStartDate:(UIButton *)sender;



//UI button, sliders, swithes and picker actions
-(IBAction)distanceSlider:(id)sender;


//SUBMIT TRIGGER
- (IBAction)submitTrigger:(UIButton *)sender;


//DISCARD TRIGGER: Clears all AAppTriggerDetails allows user to start over
- (IBAction)discardTrigger:(UIButton *)sender;

//swtich button actions
//tag 0
- (IBAction)useStoreLocationIdSwitchTurnedOn:(id)sender;
//tag 1
- (IBAction)useCurrentLocationSwitchTurnedOn:(id)sender;
//tag 2
- (IBAction)useDefaultTriggerSettingsTurnedOn:(id)sender;






@end
