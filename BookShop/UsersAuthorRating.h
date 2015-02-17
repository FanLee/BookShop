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

@property (nonatomic, retain) NSNumber * rate;
@property (nonatomic, retain) Book *book;
@property (nonatomic, retain) User *user;
@property (nonatomic, retain) Author *author;

@end
