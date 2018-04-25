//
//  DisplayFriendsViewController.h
//  FriendsAppBySqlite
//
//  Created by JETS on 2/26/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UpdateFriendsProtocol.h"
#import "DbManagement.h"

@interface DisplayFriendsViewController : UITableViewController <UpdateFriendsProtocol>

{
    DbManagement *dbMgr;
    NSMutableArray *friends ;
}

- (IBAction)addFriendBtnAction:(id)sender;



@end
