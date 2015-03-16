//
//  UsersAuthorRating.h
//  BookShop
//
//  Created by FanLee on 29.01.15.
//  Copyright (c) 2015 Fan. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "Book.h"
#import "User.h"
#import "Author.h"

@interface UsersAuthorRating : NSManagedObject

@property (nonatomic, retain) NSNumber * rating;
@property (nonatomic, retain) NSString *user;
@property (nonatomic, retain) NSString *author;

@end
