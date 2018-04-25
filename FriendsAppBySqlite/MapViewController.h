//
//  MapViewController.h
//  FriendsAppBySqlite
//
//  Created by JETS on 2/28/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "LongitudeAndLatitudeProtocol.h"
#import "MapAnnotation.h"

@interface MapViewController : UIViewController

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)mapTouchedAction:(id)sender;

@property id <LongitudeAndLatitudeProtocol> longitudeAndLatitude;
@property MapAnnotation *annotaion;
@end
