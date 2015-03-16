//
//  BSDBManager.m
//  BookShop
//
//  Created by FanLee on 29.01.15.
//  Copyright (c) 2015 Fan. All rights reserved.
//

#import "BSDBManager.h"
#import "AppDelegate.h"
#import "UsersAuthorRating.h"

@implementation BSDBManager

+(id)sharedInstance
    {
        static dispatch_once_t pred;
        static BSDBManager *sharedInstance = nil;
        dispatch_once(&pred, ^{sharedInstance = [[BSDBManager alloc] init];
        });
        return sharedInstance;
}

-(id)init
{
    self = [super init];
    if (self)
    {
        AppDelegate * appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
        context = appDelegate.managedObjectContext;
    }
    return self;
}
-(NSArray*)getEntityData:(NSString *)entityName{
    NSError * error;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    return fetchedObjects;
}
-(NSArray*)getAuthorsArray:(NSString*)authorsGenre {
    NSError * error;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Author" inManagedObjectContext:context];
    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"genre.genreName=%@",authorsGenre];
    [fetchRequest setPredicate:predicate];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    return fetchedObjects;
    
}
-(NSArray*)getBooksArray:(NSString*)authorsName {
    NSError * error;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Book" inManagedObjectContext:context];
    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"author.name=%@",authorsName];
    [fetchRequest setPredicate:predicate];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    return fetchedObjects;
    
}
-(NSArray*)getRateArray:(NSString*)authorsName {
    NSError * error;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"UsersAuthorRating" inManagedObjectContext:context];
    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"author=%@",authorsName];
    [fetchRequest setPredicate:predicate];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    return fetchedObjects;
    
}

-(NSArray*)getEntityDataWithPredicate:(NSString *)entityName
                                     :(NSString *)predicateParametr1
                                     :(NSString *)predicateParametr2{
    NSError * error;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:context];
    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"%@=%@",predicateParametr1,predicateParametr2];
    [fetchRequest setPredicate:predicate];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    return fetchedObjects;
    
}
-(float)recalcRating:(NSString*)authorName{
    NSArray *ratingArray = [self getRateArray:authorName];
    NSInteger newRaring=0;
    for (UsersAuthorRating *rate in ratingArray ) {
        newRaring+=[rate.rating integerValue];
    }
    float  averageRating=(float)newRaring/[ratingArray count];
    return averageRating;
}

-(void)newRateForAuthor:(Author*)author rate:(int)rate
{
    AppDelegate * appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
     UsersAuthorRating *newRate = [NSEntityDescription insertNewObjectForEntityForName:@"UsersAuthorRating" inManagedObjectContext:context];
    newRate.author = author.name;
    newRate.user = appDelegate.aplicationUser.email;
    newRate.rating = [NSNumber numberWithInt:rate];
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
}


@end
