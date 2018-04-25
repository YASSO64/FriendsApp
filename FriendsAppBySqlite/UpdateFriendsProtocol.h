//
//  UpdateFriendsProtocol.h
//  FriendsAppBySqlite
//
//  Created by JETS on 2/27/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import"Friend.h"

@protocol UpdateFriendsProtocol <NSObject>

-(void) addNewFriend:(Friend*)friend;

@end
