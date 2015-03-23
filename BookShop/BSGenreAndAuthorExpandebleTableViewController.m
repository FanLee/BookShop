//
//  BSGenreAndAuthorExpandebleTableViewController.m
//  BookShop
//
//  Created by FanLee on 13.01.15.
//  Copyright (c) 2015 Fan. All rights reserved.
//

#import "BSGenreAndAuthorExpandebleTableViewController.h"
#import "AppDelegate.h"
#import "User.h"
#import "Book.h"
#import "Author.h"
#import "BSAuthorTableViewCell.h"
#import "BSDBManager.h"
#import "BSAuthorViewController.h"
#import "Genre.h"
@class Author;
@implementation BSGenreAndAuthorExpandebleTableViewController

Author * currentAuthor;
NSArray *genresArrayUnsort;
NSArray *authorsArray;
NSArray *genresArray;


- (void)viewDidLoad
{
    [super viewDidLoad];
    BSDBManager* dbManager = [BSDBManager sharedInstance];
    genresArrayUnsort=[dbManager getEntityData:@"Genre"];
    NSSortDescriptor* sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"genreName" ascending:YES];
    genresArray=[genresArrayUnsort sortedArrayUsingDescriptors:@[sortDescriptor]];
    
    if (!expandedSections)
    {
        expandedSections = [[NSMutableIndexSet alloc] init];
    }
}

- (BOOL)tableView:(UITableView *)tableView canCollapseSection:(NSInteger)section
{
    if (section>=0) return YES;
    
    return NO;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [genresArray count];
}
-(NSManagedObjectContext *)managedObjectContext{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication]delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([self tableView:tableView canCollapseSection:section])
    {
        if ([expandedSections containsIndex:section])
        {
            // return rows when expanded
            Genre* genre =[genresArray objectAtIndex:section];
            NSString *genrename = genre.genreName;
            BSDBManager* dbManager = [BSDBManager sharedInstance];
            authorsArray=[dbManager getAuthorsArray:genrename];
            return ([authorsArray count]+1);
        }
    }
    
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    if ([self tableView:tableView canCollapseSection:indexPath.section] && indexPath.row == 0) {
        Genre *sectionGenre=[genresArray objectAtIndex:indexPath.section];
        cell.textLabel.text=sectionGenre.genreName;
    } else {
        if(indexPath.row>0){
            NSIndexPath *index =[NSIndexPath indexPathForRow:0 inSection:indexPath.section];
            BSDBManager *dbManager = [BSDBManager sharedInstance];
            UITableViewCell *genresCell=[self tableView:tableView cellForRowAtIndexPath:index];
            NSString *genrename=genresCell.textLabel.text;
            authorsArray=[dbManager getAuthorsArray:genrename];
            Author *authorInRow=[authorsArray objectAtIndex:(indexPath.row-1)];
            cell.textLabel.text = authorInRow.name;
            cell.accessoryView = nil;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self tableView:tableView canCollapseSection:indexPath.section])
    {
        if (!indexPath.row)
        {
            // only first row toggles exapand/collapse
            [tableView deselectRowAtIndexPath:indexPath animated:YES];
            
            NSInteger section = indexPath.section;
            BOOL currentlyExpanded = [expandedSections containsIndex:section];
            NSInteger rows;
            
            NSMutableArray *tmpArray = [NSMutableArray array];
            
            if (currentlyExpanded)
            {
                rows = [self tableView:tableView numberOfRowsInSection:section];
                [expandedSections removeIndex:section];
            }
            else
            {
                [expandedSections addIndex:section];
                rows = [self tableView:tableView numberOfRowsInSection:section];
            }
            
            for (int i=1; i<rows; i++)
            {
                NSIndexPath *tmpIndexPath = [NSIndexPath indexPathForRow:i
                                                               inSection:section];
                [tmpArray addObject:tmpIndexPath];
            }
            
            if (currentlyExpanded)
            {
                [tableView deleteRowsAtIndexPaths:tmpArray
                                 withRowAnimation:UITableViewRowAnimationTop];
                
            }
            else
            {
                [tableView insertRowsAtIndexPaths:tmpArray
                                 withRowAnimation:UITableViewRowAnimationTop];
                
                
            }
        }else{
            currentAuthor=[authorsArray objectAtIndex:indexPath.row-1];
            [self performSegueWithIdentifier:@"authorDetail" sender:self];
        }
        
    }
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue  sender:(id)sender{
    BSAuthorViewController * vc= segue.destinationViewController;
    vc.author = currentAuthor;
}

@end

