//
//  AppDelegate.m
//  artistreeApp
//
//  Created by Nicolas Roldos on 6/12/14.
//  Copyright (c) 2014 Artistree. All rights reserved.
//

#import "AppDelegate.h"
#import <GeotriggerSDK/GeotriggerSDK.h>
#import <GeotriggerSDK/AGSGTGeotriggerManager.h>

static NSString *kClientId =@"tHcMTWgQgTWrq35e";

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //set up Parse.com back end with AppId and clientKey...
    [Parse setApplicationId:@"dt19wmuOj3JYzq1wjEjO5h8fWZe9KqGpdKmBCt43"
                  clientKey:@"nAb1PiJdvb8VkZTghVHrzcn1nLmymLXI37gu5UqP"];
    
    //to track Parse analytics use this method...
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    
    //set up Geotriggers SDK with ArcGisForDevelopers App ClientId and tags assigned to triggers
    //also set tracking profile (rough/adaptive/fine)...
    [AGSGTGeotriggerManager setupWithClientId:kClientId isProduction:NO completion:^(NSError *error) {
        NSLog(@"Set up completed: %@", error);
    }];

              
    
    
    // If launched from a push notification, payload is sent to the Geotrigger Manager
    if (launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey] != nil) {
        [AGSGTGeotriggerManager handlePushNotification:launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey] showAlert:YES];
        
        // call method on map view controller to zoom
        
    //[self.mapView zoomToEnvelope:envelope]
    }
    
    //start logging location updates to compare to trigger locations
    [AGSGTGeotriggerManager sharedManager].didReceiveLocationUpdates = ^(NSArray* locations) {
        NSLog(@"new locations %@", locations);
    };
    
    
    [[AGSGTApiClient sharedClient] postPath:@"device/notify"
                                 parameters:@{@"text": @"Push notifications are working!", @"url": @"http://developers.arcgis.com"}
                                    success:^(id res) {
                                        NSLog(@"device/notify success: %@", res);
                                    }
                                    failure:^(NSError *err) {
                                        NSLog(@"device/notify failure: %@", err.userInfo);
                            }];
    
    
    
    
    return YES;
}




- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"Failed to register for remote notifications with Apple: %@", [error debugDescription]);
    [[NSNotificationCenter defaultCenter] postNotificationName:@"registerForRemoteNotificationsFailure" object:nil];
}



- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    // Register the device token with this device on the Geotrigger Service.
    [[AGSGTGeotriggerManager sharedManager] registerAPNSDeviceToken:deviceToken
                                                         completion:^(NSDictionary *info, NSError *error) {
                                                             if (error == nil) {
                                                                 [[NSNotificationCenter defaultCenter] postNotificationName:@"registerForRemoteNotificationsSuccess" object:nil];
                                                             } else {
                                                                 NSLog(@"Failed to register APNS device token: %@", error.userInfo);
                                                                 [[NSNotificationCenter defaultCenter] postNotificationName:@"registerForRemoteNotificationsFailure" object:nil];
                                                             }
                                                         }];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    // Forward the push notification payload on to the manager.
    [AGSGTGeotriggerManager handlePushNotification:userInfo showAlert:YES];
    if ([userInfo[@"aps"][@"alert"] isEqualToString:@"Trigger fired!"]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"pushNotificationReceived" object:nil];
    }
    
    // zoom to map?
}




@end
