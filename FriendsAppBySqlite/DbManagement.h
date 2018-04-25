//
//  DbManagement.h
//  FriendsAppBySqlite
//
//  Created by JETS on 2/27/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Friend.h"

@interface DbManagement : NSObject

{
    NSMutableArray *friendsList;
}

@property (strong , nonatomic) NSString *databasePath;
@property (nonatomic) sqlite3 *contactDB;
@property Friend *friend;

-(void) createDB;
-(void) addFriendToDB:(Friend *)f;
-(NSMutableArray*) getAllFriends;
-(void) deleteFriend: (Friend *)f;

@end
