//
//  User.h
//  BookShop
//
//  Created by FanLee on 27.01.15.
//  Copyright (c) 2015 Fan. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "Author.h"


@interface User : NSManagedObject

@property(nonatomic,assign)NSString *age;
@property(nonatomic,retain)NSString *email;
@property(nonatomic,retain)NSString *firstname;
@property(nonatomic,retain)NSString *gender;
@property(nonatomic,retain)NSString *lastname;
@property(nonatomic,retain)NSString *password;
@property(nonatomic,assign)NSNumber *userID;

@end
