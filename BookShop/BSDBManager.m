//
//  BSDBManager.m
//  BookShop
//
//  Created by FanLee on 29.01.15.
//  Copyright (c) 2015 Fan. All rights reserved.
//

#import "BSDBManager.h"
#import "AppDelegate.h"

@implementation BSDBManager

+(id)sharedInstance
    {
        static dispatch_once_t pred;
        static BSDBManager *sharedInstance = nil;
        dispatch_once(&pred, ^{sharedInstance = [[BSDBManager alloc] init];
        });
        return sharedInstance;
}

-(void)updateTablesData
{
    _books = [self getEntityData:@"Book"];
    _authors = [self getEntityData:@"Author"];
    _users = [self getEntityData:@"User"];
    _ratings=[self getEntityData:@"Rating"];
    _usersAuthorRating=[self getEntityData:@"UsersAuthorRating"];
}

-(id)init
{
    self = [super init];
    if (self)
    {
        AppDelegate * appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
        context = appDelegate.managedObjectContext;
        [self updateTablesData];
    }
    return self;
}

-(NSArray*)getEntityData:(NSString *)entityName
{
    NSError * error;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    return fetchedObjects;
}

-(void)newRateForAuthor:(Author*)author rate:(int)rate
{
    AppDelegate * appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    Rating *newRate = [NSEntityDescription insertNewObjectForEntityForName:@"Rating" inManagedObjectContext:context];
    newRate.author = author;
    newRate.user = appDelegate.aplicationUser;
    newRate.rating = [[NSNumber numberWithInt:rate]integerValue];
    [self saveChangesInDB];
}
-(User*)createNewUserWithUsername:(NSString*)username
{
    User *user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
    user.email = username;
    [self saveChangesInDB];
    return user;
}
-(BOOL)authentification:(NSString *)username password:(NSString *)password{
    NSError * error;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"email=%@ AND ANY password=%@",username,password];
    [fetchRequest setPredicate:predicate];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    if ([fetchedObjects count]>0) {
        return YES;
    }
    return NO;
}
-(User*)getUserFromDB:(NSString*)userName{
    User *user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
    user.email = userName;
    NSError * error;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"email=%@",userName];
    [fetchRequest setPredicate:predicate];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    for(user in fetchedObjects){
    return user;
    }
    return 0;
}
-(Author*)findAuthorByID:(NSNumber*)authorID
{
    for(Author *author in _authors)
    {
        if (author.authorID == authorID)
        {
            return author;
        }
    }
    return NULL;
}
-(Book*)findBookByID:(NSNumber*)bookID
{
    for(Book *book in _books)
    {
        if (book.bookID == bookID)
        {
            return book;
        }
    }
    return NULL;
}
-(void)saveChangesInDB
{
    AppDelegate * appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    [appDelegate saveContext];
    [self updateTablesData];
}


@end
