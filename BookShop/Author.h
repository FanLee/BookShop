//
//  Author.h
//  BookShop
//
//  Created by FanLee on 27.01.15.
//  Copyright (c) 2015 Fan. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface Author : NSManagedObject
@property(nonatomic,assign)NSInteger authorID;
@property(nonatomic,retain)NSDate *birthDate;
@property(nonatomic,retain)NSString *gender;
@property(nonatomic,retain)NSString *genre;
@property(nonatomic,retain)NSString *name;
@property(nonatomic,retain)NSData *portrait;
@end
