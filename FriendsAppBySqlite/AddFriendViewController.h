//
//  AddFriendViewController.h
//  FriendsAppBySqlite
//
//  Created by JETS on 2/26/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DbManagement.h"
#import "SetImgNameProtocol.h"
#import "UpdateFriendsProtocol.h"
#import "LongitudeAndLatitudeProtocol.h"

@interface AddFriendViewController : UIViewController <SetImgNameProtocol, LongitudeAndLatitudeProtocol>

- (IBAction)doneBtnAction:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *nameField;

@property (strong, nonatomic) IBOutlet UITextField *ageField;

@property (strong, nonatomic) IBOutlet UITextField *phoneField;

@property (strong, nonatomic) IBOutlet UILabel *showImgNameLbl;

@property (strong, nonatomic) IBOutlet UILabel *longitudeLbl;

@property (strong, nonatomic) IBOutlet UILabel *latitudeLbl;

- (IBAction)openMapBtnAction:(id)sender;

- (IBAction)addImgBtnAction:(UIButton *)sender;

@property DbManagement *dbMgrObj;

@property id<UpdateFriendsProtocol> updateFriendsProtocol;

@end
