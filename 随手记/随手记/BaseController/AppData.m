//
//  AppData.m
//  projectBase
//
//  Created by chenjianying on 15-11-16.
//  Copyright (c) 2015年 chenjianying. All rights reserved.
//

#import "AppData.h"



@implementation AppData

static AppData* mInstance;

+ (AppData*)shareInstance
{
    if (nil == mInstance)
    {
        mInstance = [[AppData alloc] init];
    }
    
    return mInstance;
}

-(id)init
{
    self = [super init];
    if(self != nil)
    {
        self.User = [NSMutableArray new];
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *path = paths.firstObject;
        NSString *filePath_User = [path stringByAppendingPathComponent:@"User"];
        NSString *filePath_Data = [path stringByAppendingPathComponent:@"Data"];
        NSString *filePath_CurrentUser = [path stringByAppendingPathComponent:@"Current_User"];
        self.User = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath_User];
        self.data = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath_Data];
        self.CurrentUser = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath_CurrentUser];
    }
    
    return self;
}
-(void)saveData
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = paths.firstObject;
    NSString *filePath_User = [path stringByAppendingPathComponent:@"User"];
    NSString *filePath_Data = [path stringByAppendingPathComponent:@"Data"];
    NSString *filePath_CurrentUser = [path stringByAppendingPathComponent:@"Current_User"];
    [NSKeyedArchiver archiveRootObject:[AppData shareInstance].User toFile:filePath_User];
    [NSKeyedArchiver archiveRootObject:[AppData shareInstance].data toFile:filePath_Data];
    [NSKeyedArchiver archiveRootObject:[AppData shareInstance].CurrentUser toFile:filePath_CurrentUser];
    
}


@end
