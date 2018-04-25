//
//  DBManager.h
//  FriendsAppBySqlite
//
//  Created by JETS on 2/26/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import "Friend.h"

@interface DBManager : UIViewController

@property (strong , nonatomic) NSString *databasePath;
@property (nonatomic) sqlite3 *contactDB;
@property Friend *friend;
-(void) addFriendToDB:(Friend *)f;

@end
