//
//  DetailsViewController.m
//  FriendsAppBySqlite
//
//  Created by JETS on 2/27/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import "DetailsViewController.h"
#import "MapAnnotation.h"
#import "MapViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [_detailsNameLbl setText:_friend.name];
    [_detailsAgeLbl setText:[@(_friend.age) stringValue]];
    [_detailsPhoneLbl setText:_friend.phone];
    [_detailsImgLbl setText:_friend.image];
    [_detailsLongitudeLbl setText:[@(_friend.longitude) stringValue]];
    [_detailsLatitudeLbl setText:[@(_friend.latitude) stringValue]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)showMapBtnAction:(id)sender {
    
    CLLocationCoordinate2D coordinates = CLLocationCoordinate2DMake([[_detailsLatitudeLbl text] doubleValue], [[_detailsLongitudeLbl text] doubleValue]);
    
    MapAnnotation *mapAnnotation = [MapAnnotation new];
    [mapAnnotation setCoordinate: coordinates];
    [mapAnnotation setTitle: @"Selected Location"];
    
    MapViewController *mapViewObj = [self.storyboard instantiateViewControllerWithIdentifier:@"mapViewId"];
    [mapViewObj setAnnotaion:mapAnnotation];
    [self.navigationController pushViewController:mapViewObj animated:YES];
    
    
    
}
@end
