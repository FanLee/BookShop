//
//  Rating.h
//  BookShop
//
//  Created by FanLee on 27.01.15.
//  Copyright (c) 2015 Fan. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "Author.h"
#import "User.h"

@interface Rating : NSManagedObject
@property(nonatomic,assign)NSInteger rating;
@property(nonatomic,retain)Author *author;
@property(nonatomic,retain)User *user;
@end
