//
//  BSWIDBViewController.m
//  BookShop
//
//  Created by FanLee on 12.02.15.
//  Copyright (c) 2015 Fan. All rights reserved.
//

#import "BSWIDBViewController.h"
#import "Book.h"
#import "Author.h"
#import "User.h"
#import "AppDelegate.h"
#import "Genre.h"

@interface BSWIDBViewController ()

@end

@implementation BSWIDBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;
    AppDelegate * appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    }
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)WtiteInDBAction:(id)sender{
    [self WriteInDB];
}
-(NSManagedObjectContext *)managedObjectContext{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication]delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}
-(void)WriteInDB{
    NSManagedObjectContext *context = [self managedObjectContext];
    AppDelegate * appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    User *user1 = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
    user1.userID =@0;
    user1.email = @"fl";
    user1.password = @"qqq";
    user1.firstname = @"f";
    user1.lastname = @"l";
    user1.gender = @"Male";
    user1.age=@25;
    
    Book *book1 = [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:context];
    Book *book2 = [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:context];
    Book *book3 = [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:context];
    Book *book4 = [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:context];
    Book *book5 = [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:context];
    Book *book6 = [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:context];
    Author *author1 = [NSEntityDescription insertNewObjectForEntityForName:@"Author" inManagedObjectContext:context];
    Author *author2 = [NSEntityDescription insertNewObjectForEntityForName:@"Author" inManagedObjectContext:context];
    Author *author3 = [NSEntityDescription insertNewObjectForEntityForName:@"Author" inManagedObjectContext:context];
    Author *author4 = [NSEntityDescription insertNewObjectForEntityForName:@"Author" inManagedObjectContext:context];
    Genre *genre1 = [NSEntityDescription insertNewObjectForEntityForName:@"Genre" inManagedObjectContext:context];
    Genre *genre2 = [NSEntityDescription insertNewObjectForEntityForName:@"Genre" inManagedObjectContext:context];
    Genre *genre3 = [NSEntityDescription insertNewObjectForEntityForName:@"Genre" inManagedObjectContext:context];
    Genre *genre4 = [NSEntityDescription insertNewObjectForEntityForName:@"Genre" inManagedObjectContext:context];
    
    genre1.genreID = @1;
    genre1.genreName =@"Horrors";
    
    genre2.genreID = @2;
    genre2.genreName =@"Detectives";
    
    genre3.genreID = @3;
    genre3.genreName =@"Adventures";
    
    genre4.genreID = @4;
    genre4.genreName =@"Romantic";
    
    
    book1.bookID = @1;
    book1.title = @"NewBook1";
    book1.genre = genre1;
    
    book2.bookID = @2;
    book2.title = @"NewBook2";
    book2.genre = genre1;
    
    book3.bookID = @3;
    book3.title = @"NewBook3";
    book3.genre = genre2;
    
    book4.bookID = @4;
    book4.title = @"NewBook4";
    book4.genre = genre2;
    
    book5.bookID = @5;
    book5.title = @"NewBook5";
    book5.genre = genre3;
    
    book6.bookID =@6;
    book6.title = @"NewBook6";
    book6.genre = genre3;
    
    
    author1.authorID = @1;
    author1.genre = genre1;
    author1.birthdate = @"21/09/1947";
    author1.name = @"King";
    author1.gender=@"Male";
    book1.author = author1;
    
    author4.authorID = @4;
    author4.genre = genre4;
    author4.birthdate = @"21/09/1947";
    author4.name = @"King 2";
    author4.gender=@"Male";
    book4.author = author4;
    
    author2.authorID = @2;
    author2.genre = genre2;
    author2.birthdate = @"30/11/1906";
    author2.name = @"Dickson";
    author2.gender=@"Male";
    book3.author = author2;
    
    author3.authorID = @3;
    author3.genre = genre3;
    author3.birthdate = @"8/02/1828";
    author3.name = @"Verne";
    author3.gender=@"Male";
    book5.author = author3;
    
    [appDelegate saveContext];
}
@end

