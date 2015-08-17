//
//  MapAnnotation.h
//  artistreeApp
//
//  Created by Nicolas Roldos on 6/29/14.
//  Copyright (c) 2014 Artistree. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface MapAnnotation : NSObject <MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

@end
