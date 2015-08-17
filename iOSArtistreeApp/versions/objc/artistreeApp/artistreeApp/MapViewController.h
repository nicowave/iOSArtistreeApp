//
//  MapViewController.h
//  artistreeApp
//
//  Created by Nicolas Roldos on 6/15/14.
//  Copyright (c) 2014 Artistree. All rights reserved.
//


#import "Store.h"
#import "MapAnnotation.h"
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <Parse/Parse.h>
#import <CoreLocation/CoreLocation.h>


@interface MapViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *vinylStoresMapView;
@property (strong, nonatomic) MKMapView *zoomRegion;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *theButton;

- (IBAction)zoomToCurrentLocation:(UIBarButtonItem *)sender;

- (IBAction)setMapView:(id)sender;


- (IBAction)distanceSlider:(UISlider *)sender;


@property CLLocationManager *locationManager;
@property CLLocationSpeed *startLocation;


@end
