//
//  AddFriendViewController.m
//  FriendsAppBySqlite
//
//  Created by JETS on 2/26/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import "AddFriendViewController.h"
#import "DBManager.h"
#import "Friend.h"
#import "AddImgViewController.h"
#import "MapViewController.h"

@interface AddFriendViewController ()

@end

@implementation AddFriendViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)doneBtnAction:(id)sender {
    
    Friend *f = [Friend new];
    f.name = [_nameField text];
    f.age = [[_ageField text] doubleValue];
    f.phone = [_phoneField text];
    f.image = [_showImgNameLbl text];
    f.longitude = [[_longitudeLbl text] doubleValue];
    f.latitude = [[_latitudeLbl text] doubleValue];
    
    [_dbMgrObj addFriendToDB:f];
    
    [_nameField setText:@""];
    [_ageField setText:@""];
    [_phoneField setText:@""];
    [_showImgNameLbl setText:@""];
    [_longitudeLbl setText:@""];
    [_latitudeLbl setText:@""];
    
    [_updateFriendsProtocol addNewFriend:f];
}

- (IBAction)addImgBtnAction:(UIButton *)sender {
   
    AddImgViewController *addImgViewObj = [self.storyboard instantiateViewControllerWithIdentifier:@"addImgViewId"];
    
    [addImgViewObj setMyProtocol:self];
    
    [self.navigationController pushViewController:addImgViewObj animated:YES];
}

-(void)setImgName:(NSString*)imgName {
    [_showImgNameLbl setText: imgName];
}

- (IBAction)openMapBtnAction:(id)sender {
    
    MapViewController *mapViewObj = [self.storyboard instantiateViewControllerWithIdentifier:@"mapViewId"];
    
    [mapViewObj setLongitudeAndLatitude:self];
    
    [self.navigationController pushViewController:mapViewObj animated:YES];
}

-(void) addLongitudeAndLatitude:(double)longitude :(double)latitude{

    [_longitudeLbl setText:[@(longitude) stringValue]];
    [_latitudeLbl setText:[@(latitude) stringValue]];
}

@end
