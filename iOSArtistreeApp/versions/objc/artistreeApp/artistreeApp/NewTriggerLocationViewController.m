//
//  NewTriggerLocationViewController.m
//  artistreeApp
//
//  Created by Nicolas Roldos on 6/17/14.
//  Copyright (c) 2014 Artistree. All rights reserved.
//

#import "NewTriggerLocationViewController.h"



@interface NewTriggerLocationViewController ()
@property CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet UIDatePicker *startDatePicker;

@property AAppTriggerDetails *triggerDetails;

@property (weak, nonatomic) IBOutlet UIDatePicker *datepickerOne;

@end



@implementation NewTriggerLocationViewController


- (void)startStandardUpdates {
    if (nil == self.locationManager) {
        self.locationManager =[[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
        self.locationManager.distanceFilter = 50; //meters
        [self.locationManager startUpdatingLocation];
    }
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    [scroller setScrollEnabled:YES];
    [scroller setContentSize:CGSizeMake(320, 2200)];
    
    
}





- (IBAction)setEventTag:(UITextField *)sender {
    
     _triggerDetails.aAppEventTag = self.eventTag.text;
    [sender resignFirstResponder];
}






- (IBAction)setEventDescription:(UITextField *)sender {
    
    //sets text for push notification display text
    //stores this display text into 'annotation string object' called aAppEventPushDetails
    //resigns keyboard in order to allow user to continue filling out TriggerDetails
    _triggerDetails.aAppEventPushDetails = self.eventDescription.text;
    [sender resignFirstResponder];
}




- (IBAction)confirmStartDate:(UIButton *)sender {
    
    NSDate *chosenStart = [self.startDatePicker date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = @"MM/dd/yyyy";
    
    NSString *dateString = [dateFormatter stringFromDate: chosenStart];
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc]init];
    
    timeFormatter.dateFormat = @"HH:mm:ss";
    NSString *timeString = [timeFormatter stringFromDate: chosenStart];
    
    self.startDate.text = dateString;
    self.startTime.text = timeString;
}






- (IBAction)distanceSlider:(UISlider *)sender {
    
    //setting button with user input of trigger radius 'distance' taken from UISlider object

    int theValue = sender.value;
    self.triggerDistanceButton.title = [NSString stringWithFormat:@"Set trigger diameter to %d feet", theValue];
    
    
    //  trigger radius 'distance' stored in theValue variable
    // 'distance' sent to UIBarButton called 'triggerDistanceButton'
    
}





- (IBAction)triggerDistanceButton:(UIBarButtonItem *)sender {
    
    NSInteger triggerSize = self.distanceSlider.value;
    
    
    /*
    //To grab values from button string...
    NSString *originalString = self.triggerRadiusButton.title;
    NSString *numberString;
    //create NSScanner object and set possible numbers using NSCharacterSet
    NSScanner *scanner = [NSScanner scannerWithString:originalString];
    NSCharacterSet *numbers = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    // Throw away characters before the first number.
    [scanner scanUpToCharactersFromSet:numbers intoString:NULL];
    [scanner scanCharactersFromSet:numbers intoString:&numberString];
    // Result: triggerSize back in integer form
    //NSInteger triggerSize = [numberString integerValue];
     */
    
    
    
    //AAppTriggerDetails distance added as Trigger Size to newTriggerDetails object of trpe AAppTriggerDetails
    
    CLLocationDistance distanceRadius = triggerSize;
    _triggerDetails.aAppTriggerSize = distanceRadius;
    
}
     

    
- (IBAction)useCurrentLocationSwitchTurnedOn:(id)sender {
    
    if (_currentLocationSwitch.on) {
        
        [self startStandardUpdates];
        
        
        // assign current location to pointer to locationManager's current updates on Lat and Long
        // grab latitude and longitude from  currentLocation object and store as CLLocation degrees variable
        // 'triggerLatitude' and 'triggerLongitude'
        CLLocation *currentLocation = self.locationManager.location;
        CLLocationDegrees triggerLatitude = currentLocation.coordinate.latitude;
        CLLocationDegrees triggerLongitude = currentLocation.coordinate.longitude;
        
        _triggerDetails.latitude = triggerLatitude;
        _triggerDetails.longitude = triggerLongitude;
        
    } else if (_currentLocationSwitch.on == 0){
        
    }
    
    
    
}


- (IBAction)submitTrigger:(UIButton *)sender {
    AGSGTTriggerBuilder *builder = [AGSGTTriggerBuilder new];
    
    builder.triggerId = _triggerDetails.aAppstoreId;
    builder.tags = @[[AGSGTGeotriggerManager sharedManager].deviceDefaultTag, _triggerDetails.aAppEventTag];
    builder.direction = @"leave";
    //[builder setGeoWithLocation:location distance:100];
    builder.notificationText = @"Trigger fired!";
    NSDictionary *params = [builder build];
    
    
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



- (IBAction)useStoreLocationIdSwitchTurnedOn:(id)sender {
     }
- (IBAction)useDefaultTriggerSettingsTurnedOn:(id)sender {
     }


- (IBAction)discardTrigger:(UIButton *)sender {
}

   
   
   
@end


