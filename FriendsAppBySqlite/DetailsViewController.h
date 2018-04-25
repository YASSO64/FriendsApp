//
//  DetailsViewController.h
//  FriendsAppBySqlite
//
//  Created by JETS on 2/27/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Friend.h"

@interface DetailsViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *detailsNameLbl;

@property (strong, nonatomic) IBOutlet UILabel *detailsAgeLbl;

@property (strong, nonatomic) IBOutlet UILabel *detailsPhoneLbl;

@property (strong, nonatomic) IBOutlet UILabel *detailsImgLbl;

@property (strong, nonatomic) IBOutlet UILabel *detailsLongitudeLbl;

@property (strong, nonatomic) IBOutlet UILabel *detailsLatitudeLbl;

- (IBAction)showMapBtnAction:(id)sender;

@property Friend* friend;

@end
