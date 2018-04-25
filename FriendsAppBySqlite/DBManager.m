//
//  DBManager.m
//  FriendsAppBySqlite
//
//  Created by JETS on 2/26/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import "DBManager.h"
#import "Friend.h"

@interface DBManager ()


@end

@implementation DBManager


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *docsDir;
    NSArray *dirPaths;
    
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
        "CREATE TABLE IF NOT EXISTS CONTACTS (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, AGE FLOAT, PHONE TEXT, IMAGE TEXT)";
        
        if (sqlite3_exec(_contactDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
        {
            printf("Failed to create table");
        }else{
            printf("table created");
        }
        sqlite3_close(_contactDB);
    } else {
        printf("Failed to open/create database");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) addFriendToDB:(Friend *)f {
    
    sqlite3_stmt *statement;
    const char *dbpath = [_databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &_contactDB) == SQLITE_OK)
    {
        NSString *insertSQL = [NSString stringWithFormat:
        @"INSERT INTO CONTACTS (name, age, phone, image) VALUES (\"%@\", \"%f\", \"%@\", \"%@\")", _friend.name, _friend.age, _friend.phone, _friend.image];
        
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(_contactDB, insert_stmt, -1, &statement, NULL);
        
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            printf("Contact added");
            
        } else {
            printf("Failed to add contact\n");
            NSLog(@"%s",sqlite3_errmsg(_contactDB));
        }
        
        sqlite3_finalize(statement);
        sqlite3_close(_contactDB);
    }
    
}


@end
