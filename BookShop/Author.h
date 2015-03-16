//
//  Author.h
//  BookShop
//
//  Created by FanLee on 27.01.15.
//  Copyright (c) 2015 Fan. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "Book.h"
#import "Genre.h"
@class Book,Genre;

@interface Author : NSManagedObject
@property(nonatomic,assign)NSNumber* authorID;
@property(nonatomic,retain)NSString *birthdate;
@property(nonatomic,retain)NSString *gender;
@property(nonatomic,retain)NSString *name;
@property(nonatomic,retain)NSData *portrait;
@property(nonatomic,retain)NSSet *books;
@property(nonatomic,retain)Genre *genre;
@end

/*@interface Author (CoreDataGeneratedAccessors)

- (void)addAuthorsBooksObject:(Book *)value;
@end*/
