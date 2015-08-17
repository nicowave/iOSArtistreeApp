//
//  Store.m
//  artistreeApp
//
//  Created by Nicolas Roldos on 6/24/14.
//  Copyright (c) 2014 Artistree. All rights reserved.
//

#import "Store.h"
#import <Parse/Parse.h>



@implementation Store

- (id)initWithPFObject:(PFObject*)object
{
    self = [super init];
    if (self) {
        
        self.name = object[@"name"];
        
        NSNumber *latitude = [object valueForKeyPath:@"latitude"];
        double latitudeDouble = [latitude doubleValue];
        self.storelatitude = latitudeDouble;

        
        NSNumber *longitude = [object valueForKeyPath:@"longitude"];
        double  longitudeDouble =[longitude doubleValue];
        self.storelongitude = longitudeDouble;
                              
        self.address = [object valueForKey:@"address"];
        self.city = [object valueForKey:@"city"];
        self.state = [object valueForKey:@"state"];
        self.zip = [object valueForKey:@"zip"];
        self.phoneNumber = [object valueForKey:@"phone"];
        self.storeHours = [object valueForKey:@"hours"];
        self.FID = [object valueForKey:@"FID"];
        
        
        
        //self.storeImage = [object valueForKeyPath:@"pic_url"];
        
        
    }
    return self;
}




- (NSMutableArray *) allStoreNames {
    NSMutableArray *allStoreNames = [[NSMutableArray alloc] init];
    PFQuery *query = [PFQuery queryWithClassName:@"storeInfo"];
    [query whereKey:@"tag" equalTo:@"artistree"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error) {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        } else {
            for (PFObject *parseobject in objects) {
                Store *store = [[Store alloc] initWithPFObject:parseobject];
                NSString *storeString = store.name;
                [allStoreNames addObject:storeString];
                NSLog(@"%@ store name was added", store.name);
            }
        }
    }];

    return allStoreNames;
}


- (NSMutableArray *) allStores {
    NSMutableArray *allStores = [[NSMutableArray alloc] init];
    PFQuery *query = [PFQuery queryWithClassName:@"storeInfo"];
    [query whereKey:@"tag" equalTo:@"artistree"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error) {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        } else {
            for (PFObject *parseobject in objects) {
                Store *store = [[Store alloc] initWithPFObject:parseobject];
                [allStores addObject:store];
                NSLog(@"%@ was added", store.name);
            }
        }
    }];
    
    return allStores;
}


- (NSMutableArray *) allStoreDetails {
    
    NSMutableArray *allStoreDetails= [[NSMutableArray alloc] init];
    PFQuery *query = [PFQuery queryWithClassName:@"storeInfo"];
    [query whereKey:@"tag" equalTo:@"artistree"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error) {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        } else {
            for (PFObject *parseobject in objects) {
                
                Store *store = [[Store alloc] initWithPFObject:parseobject];
                [allStoreDetails addObject:store.address];
                [allStoreDetails addObject:store.city];
                [allStoreDetails addObject:store.state];
                [allStoreDetails addObject:store.zip];
                [allStoreDetails addObject:store.phoneNumber];
                [allStoreDetails addObject:store.storeHours];
                [allStoreDetails addObject:store.FID];
           
                
                NSLog(@"%@, %@, %@, %@, %@, %@, %@, was added", store.address, store.city, store.state, store.zip, store.phoneNumber, store.storeHours, store.FID);
            }
        }
    }];
    
    return allStoreDetails;
}





- (NSArray *) allStoreImages {
    
    
    NSArray *allStoreImages = [[NSArray alloc]init];
    allStoreImages = @[@"_at_1Amoeba",
                       
                       @"_at_2Backside",
                       
                       @"_at_3Caveman",
                       
                       @"_at_4Fingerprints",
                       
                       @"_at_5GimmeGimme",
                    
                       @"_at_6HighFidelity",
                       
                       @"_at_7Melrose_7",
                       
                       @"_at_8MonoRecords_8.jpg",
                       
                       @"_at_9Atomic_9.jpg",
                       
                       @"_at_10CanterburyRecords",
                       
                       @"_at_11CDTraderTarzana",
                       
                       @"_at_12DyzzyOnVinyl",
                       
                       @"_at_13FreakBeat",
                       
                       @"_at_14GrooveRiders",
                       
                       @"_at_15LolipopRecords",
                       
                       @"_at_16MidnightRecords",
                       
                       @"_at_17MountAnalogRecords",
                       
                       @"_at_18MusicCityRecords",
                       
                       @"_at_19PMSoundsRecords",
                       
                       @"_at_20RecordParlour",
                       
                       @"_at_21ResistorRecords",
                       
                       @"_at_22SoundCheck",
                       
                       @"_at_23StreetSoundsRecords",
                       
                       @"_at_24ThirdEyeRecords",
                       
                       @"_at_25VIPRecords",
                       
                       @"_at_26VinylSolutions",
                       
                       @"_at_27OrigamiVinyl",
                       
                       @"_at_28TheRecordCollectorLA",
                       
                       @"_at_29RecordSurplus",

                       @"_at_30RockawayRecordStore",
                       
                       @"_at_31SoundsationsRecords",
                       
                       @"_at_32TheLastBookstore",
                       
                       @"_at_33TKORecords",
                       
                       @"_at_34VacationRecords",
                       
                       @"_at_35WombletonRecords",
                       
                       @"_at_36RedlandsBackyard",
                       
                       @"_at_37RedlandsVinylCollectibles",
                       
                       @"_at_38KatzAlleyRecordsAndBooks",
                       
                       @"_at_39UniversityOfRedlands",
                       
                       ];
    
    return allStoreImages;
}


@end
