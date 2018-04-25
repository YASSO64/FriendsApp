//
//  DbManagement.m
//  FriendsAppBySqlite
//
//  Created by JETS on 2/27/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import "DbManagement.h"
#import "Friend.h"

@implementation DbManagement

NSString *docsDir;
NSArray *dirPaths;

-(void) createDB {

    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = dirPaths[0];
    
    // Build the path to the database file
    _databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"contacts.db"]];
    
    
    const char *dbpath = [_databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &_contactDB) == SQLITE_OK)
    {
        char *errMsg;
        const char *sql_stmt =
        "create table if not exists contacts (id integer primary key autoincrement, name text UNIQUE, age double, phone text, image text, longitude double, latitude double)";
        
        if (sqlite3_exec(_contactDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
        {
            printf("Failed to create table\n");
        }else{
            printf("table created\n");
        }
        
        sqlite3_close(_contactDB);
    }
    else {
        printf("Failed to open/create database\n");
    }
}

-(void) addFriendToDB:(Friend *)f {
    
    sqlite3_stmt *statement;
    const char *dbpath = [_databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &_contactDB) == SQLITE_OK)
    {
        NSString *insertSQL = [NSString stringWithFormat:
            @"insert into contacts (name, age, phone, image, longitude, latitude) values (\"%@\", \"%lf\", \"%@\", \"%@\", \"%lf\", \"%lf\")", f.name, f.age, f.phone, f.image, f.longitude, f.latitude];
        
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(_contactDB, insert_stmt, -1, &statement, NULL);
        
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            printf("Contact added\n");
        } else {
            printf("Failed to add contact\n");
            NSLog(@"%s",sqlite3_errmsg(_contactDB));
        }
        
        sqlite3_finalize(statement);
        sqlite3_close(_contactDB);
    }
}

-(NSMutableArray*) getAllFriends {

    const char *dbpath = [_databasePath UTF8String];
    sqlite3_stmt *statement;
    
    if (sqlite3_open(dbpath, &_contactDB) == SQLITE_OK)
    {
        friendsList = [NSMutableArray new];
        NSString *querySQL = [NSString stringWithFormat:
        @"select * from contacts"];

        const char *query_stmt = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(_contactDB, query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            printf("sqlite is prepared\n");
            
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                Friend *friend = [Friend new];
                
                friend.name = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(statement, 1)];
                friend.age = sqlite3_column_double(statement, 2);
                friend.phone = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(statement, 3)];
                friend.image = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(statement, 4)];
                friend.longitude = sqlite3_column_double(statement, 5);
                friend.latitude = sqlite3_column_double(statement, 6);

                [friendsList addObject:friend];
            }
            sqlite3_finalize(statement);
        }
        else {
            printf("%s\n",sqlite3_errmsg(_contactDB));
        }
        sqlite3_close(_contactDB);
    }
    
    return friendsList;
}

-(void) deleteFriend: (Friend *)f {

    sqlite3_stmt *statement;
    const char *dbpath = [_databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &_contactDB) == SQLITE_OK)
    {
        NSString *deleteSQL = [NSString stringWithFormat:
        @"delete from contacts where name = '%@'", f.name];
        
        const char *delete_stmt = [deleteSQL UTF8String];
        sqlite3_prepare_v2(_contactDB, delete_stmt, -1, &statement, NULL);
        
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            printf("Contact deleted\n");
        } else {
            printf("Failed to delete contact\n");
            NSLog(@"%s",sqlite3_errmsg(_contactDB));
        }
        
        sqlite3_finalize(statement);
        sqlite3_close(_contactDB);
    }
}

@end
