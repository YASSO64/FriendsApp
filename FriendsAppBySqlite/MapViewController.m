//
//  MapViewController.m
//  FriendsAppBySqlite
//
//  Created by JETS on 2/28/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import "MapViewController.h"
#import "MapAnnotation.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    if(_annotaion != nil){
        [_mapView addAnnotation:_annotaion];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)mapTouchedAction:(id)sender {
    
    CGPoint touchedPoint = [sender locationInView: _mapView];
    printf("x = %lf , y = %lf\n", touchedPoint.x, touchedPoint.y);
    
    CLLocationCoordinate2D touchedLocation = [_mapView convertPoint:touchedPoint toCoordinateFromView:_mapView];
    
    printf("longitude %lf , latitude %lf\n", touchedLocation.longitude, touchedLocation.latitude);
    
    [_longitudeAndLatitude addLongitudeAndLatitude:touchedLocation.longitude :touchedLocation.latitude];

}
@end
