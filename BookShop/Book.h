//
//  Book.h
//  BookShop
//
//  Created by FanLee on 27.01.15.
//  Copyright (c) 2015 Fan. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "Author.h"
#import "Genre.h"

@class Author,Book,Genre;

@interface Book : NSManagedObject
@property(nonatomic,assign)NSNumber* bookID;
@property(nonatomic,retain)Genre *genre;
@property(nonatomic,retain)NSString *title;
@property(nonatomic,retain)Author *author;
@end
