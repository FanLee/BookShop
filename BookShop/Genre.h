//
//  Genre.h
//  BookShop
//
//  Created by FanLee on 12.02.15.
//  Copyright (c) 2015 Fan. All rights reserved.
//

#import <CoreData/CoreData.h>
@class Author,Book;
@interface Genre : NSManagedObject

@property(nonatomic,strong)NSString *genreName;
@property(nonatomic,assign)NSNumber *genreID;
@property(nonatomic,retain)Author   *author;
@property(nonatomic,retain)Book *book;
@end
