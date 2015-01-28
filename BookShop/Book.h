//
//  Book.h
//  BookShop
//
//  Created by FanLee on 27.01.15.
//  Copyright (c) 2015 Fan. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface Book : NSManagedObject
@property(nonatomic,assign)NSInteger bookID;
@property(nonatomic,retain)NSString *genre;
@property(nonatomic,retain)NSString *title;
@end
