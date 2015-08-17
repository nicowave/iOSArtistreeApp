//
//  AAppTriggerDetails.h
//  artistreeApp
//
//  Created by Nicolas Roldos on 7/21/14.
//  Copyright (c) 2014 Artistree. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface AAppTriggerDetails : NSObject

//trigger latitude and longitude
@property (nonatomic, assign) CLLocationDegrees latitude;
@property (nonatomic, assign) CLLocationDegrees longitude;
@property (nonatomic, assign) CLLocationDistance aAppTriggerSize;


//tag, store, push notification details
@property (nonatomic, copy) NSString *aAppEventTag;
@property (nonatomic, copy) NSString *aAppstoreName;
@property (nonatomic, copy) NSString *aAppstoreId;
@property (nonatomic, copy) NSString *aAppEventPushDetails;


//geocoding fields
@property (nonatomic, copy) NSString *gcAddress;
@property (nonatomic, copy) NSString *gcCity;
@property (nonatomic, copy) NSString *gcState;
@property (nonatomic, copy) NSString *gcZip;

//other trigger details
@property (nonatomic, copy) NSString *aAppAccuracy;
@property (nonatomic, copy) NSString *aAppTriggerDirection;


@end
