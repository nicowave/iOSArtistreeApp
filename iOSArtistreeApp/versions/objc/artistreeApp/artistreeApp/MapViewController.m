//
//  MapViewController.m
//  artistreeApp
//
//  Created by Nicolas Roldos on 6/15/14.
//  Copyright (c) 2014 Artistree. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()



@end


#define FINGERPRINTS_latitude 33.771481;
#define FINGERPRINTS_longitude -118.1872;
#define mapSpan 0.10f;

@implementation MapViewController

@synthesize vinylStoresMapView;



MKCoordinateRegion region;



- (IBAction)zoomToCurrentLocation:(UIBarButtonItem *)sender {
    
    
    region.center.latitude = self.vinylStoresMapView.userLocation.coordinate.latitude;
    region.center.longitude = self.vinylStoresMapView.userLocation.coordinate.longitude;
    [self.vinylStoresMapView setRegion:region animated:YES];
    
    
}



- (IBAction)distanceSlider:(UISlider *)sender {
    
    int theValue = sender.value;
    float theSpan = theValue * 0.0145;
    region.span = MKCoordinateSpanMake(theSpan, 0.0);
    self.theButton.title = [NSString stringWithFormat:@"Zoom to %d Miles", theValue];
}







- (void)startStandardUpdates {
    if (nil == self.locationManager) {
        
        self.locationManager =[[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
        self.locationManager.distanceFilter = 50; //meters
        [self.locationManager startUpdatingLocation];
    }
}







- (void)MapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    
    //Get user coordinates
    CLLocationCoordinate2D mylocation = [userLocation coordinate];
    
    //NSLog(@"%f, %f", vinylStoresMapView.userLocation.latitude, mylocation.longitude);
    
    //zoom region in meters
    MKCoordinateRegion zoomRegion = MKCoordinateRegionMakeWithDistance(mylocation,  2500, 2500);
    
    [vinylStoresMapView setRegion:zoomRegion animated:YES];
    
    [vinylStoresMapView setZoomEnabled:YES];
    
    
}








-(void)viewDidLoad
{

    [super viewDidLoad];
    

//self.vinylStoresMapView.delegate = self;
//[self.vinylStoresMapView setShowsUserLocation: YES];
    
    //starts standard updates so app can begin pinging server for users location
    [self startStandardUpdates];
    
    NSMutableArray *allStores = [[NSMutableArray alloc] init];
    NSMutableArray *locations = [[NSMutableArray alloc] init];
    
 
    
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
            
            CLLocationCoordinate2D location;
            MapAnnotation *myAnn;
            for (Store *store in allStores) {
                
                myAnn = [[MapAnnotation alloc]init];
                location.latitude = store.storelatitude;
                location.longitude = store.storelongitude;
                myAnn.coordinate = location;
                myAnn.title = store.name;
                CLLocation *currentLocation = self.locationManager.location;
                CLLocation *storeLocation = [[CLLocation alloc] initWithLatitude:store.storelatitude longitude:store.storelongitude];
                CLLocationDistance distanceToStore = [currentLocation distanceFromLocation:storeLocation];
                double distance = distanceToStore / 1600;
                NSString *distanceInMiles = [NSString stringWithFormat:@"%.2f miles away", distance];
                NSLog(@"%@, at %f, %f is %@", myAnn.title, store.storelatitude, store.storelongitude, distanceInMiles);
                myAnn.subtitle = distanceInMiles;
                [locations addObject:myAnn];
                
            }
            //int annotationLength =  locations.count;
            //NSLog(@" %d", annotationLength);
            [vinylStoresMapView addAnnotations:locations];
        }
    }];
    //assign annotaions
    
}






- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (IBAction)zoomCurrentLocation:(id)sender {
    vinylStoresMapView.showsUserLocation = YES;
    
    
    
    //CLLocationCoordinate2D myCurrentLocation = [vinylStoresMapView.userLocation coordinate];
    
    //MKCoordinateRegion zoomRegion = MKCoordinateRegionMakeWithDistance(myCurrentLocation, );
    
    //[vinylStoresMapView setRegion:zoomRegion animated:YES];
    
    
}

- (IBAction)setMapView:(id)sender {
    
    switch (((UISegmentedControl *) sender).selectedSegmentIndex) {
        case 0:
            vinylStoresMapView.mapType = MKMapTypeStandard;
            break;
        case 1:
            vinylStoresMapView.mapType = MKMapTypeSatellite;
            break;
        case 2:
            vinylStoresMapView.mapType = MKMapTypeHybrid;
            break;

            
        default:
            break;
    }
    
}


@end
