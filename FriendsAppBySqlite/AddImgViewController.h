//
//  AddImgViewController.h
//  FriendsAppBySqlite
//
//  Created by JETS on 2/26/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import"SetImgNameProtocol.h"

@interface AddImgViewController : UITableViewController

{
    NSMutableArray *images;
}

@property id<SetImgNameProtocol> myProtocol;

@end
