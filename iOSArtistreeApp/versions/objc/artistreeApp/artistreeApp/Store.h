//
//  Store.h
//  artistreeApp
//
//  Created by Nicolas Roldos on 6/24/14.
//  Copyright (c) 2014 Artistree. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreLocation/CLLocation.h>
#import <MapKit/MapKit.h>
#import <Parse/Parse.h>



@class PFObject;

@interface Store : NSObject <CLLocationManagerDelegate>



@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSNumber *FID;
@property (nonatomic, copy) UIImage *storeImage;

@property (nonatomic, copy) NSString *phoneNumber;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, copy) NSNumber *zip;
@property (nonatomic, copy) NSString *storeHours;



//@property CLLocation *storeLocation;
@property CLLocationManager *locationManager;

@property (nonatomic) double storelatitude;
@property (nonatomic) double storelongitude;



- (NSMutableArray *) allStoreNames;
- (NSMutableArray *) allStores;
- (NSArray *) allStoreImages;
- (NSMutableArray *) allStoreDetails;

- (id)initWithPFObject:(PFObject*)object;

@end
