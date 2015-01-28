//
//  User.h
//  BookShop
//
//  Created by FanLee on 27.01.15.
//  Copyright (c) 2015 Fan. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface User : NSManagedObject
@property(nonatomic,assign)NSInteger age;
@property(nonatomic,retain)NSString *email;
@property(nonatomic,retain)NSString *firstName;
@property(nonatomic,retain)NSString *gender;
@property(nonatomic,retain)NSString *lastName;
@property(nonatomic,retain)NSString *password;
@property(nonatomic,assign)NSInteger userID;
@end
