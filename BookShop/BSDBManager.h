//
//  BSDBManager.h
//  BookShop
//
//  Created by FanLee on 29.01.15.
//  Copyright (c) 2015 Fan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Author.h"
#import "Book.h"
#import "Rating.h"
#import "UsersAuthorRating.h"

@interface BSDBManager : NSObject{
    NSManagedObjectContext *context;
}
@property(nonatomic,strong)NSArray *books;
@property(nonatomic,strong)NSArray *users;
@property(nonatomic,strong)NSArray *authors;
@property(nonatomic,strong)NSArray *ratings;
@property(nonatomic,strong)NSArray *usersAuthorRating;

+(id)sharedInstance;
-(NSArray*)getEntityData:(NSString*)entityName;
-(User*)createNewUserWithUsername:(NSString*)username;
-(User*)getUserFromDB:(NSString*)username;
-(BOOL)authentification:(NSString*)username password:(NSString*)password;
-(void)newRateForAuthor:(Author*)book rate:(int)rate;
-(void)saveChangesInDB;
-(Author*)findAuthorByID:(NSNumber*)authorID;
-(Book*)findBookByID:(NSNumber*)bookID;


@end
